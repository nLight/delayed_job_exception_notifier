module Delayed
  module Plugins
    class ExceptionNotifier < Plugin
      module Notify
        def error(job, exception)
          ::ExceptionNotifier::Notifier.background_exception_notification(exception,
            :data => { :job_id => job.id, :queue => job.queue }).deliver
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
