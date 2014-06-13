require 'delayed_job'

module Delayed
  module Plugins
    class ExceptionNotifier < Plugin
      module Notify
        def error(job, exception)
          data = {data: { job_id: job.id, queue: job.queue }}
          
          ::ExceptionNotifier.notify_exception(exception, data)
          
          super if defined?(super)
        end
      end

      callbacks do |lifecycle|
        lifecycle.before(:invoke_job) do |job|
          payload = job.payload_object
          payload = payload.object if payload.is_a? Delayed::PerformableMethod
          payload.extend Notify
        end
      end
    end
  end
end
