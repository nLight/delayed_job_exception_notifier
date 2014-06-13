module Delayed
  module Backend
    module Dummy
      class Job
        include Delayed::Backend::Base

        attr_accessor :priority, :run_at, :queue, :last_error, :attempts, :id,
                      :failed_at, :locked_at, :locked_by, :handler

        def initialize(options)
          @attempts = 0
          @payload_object = options[:payload_object]
        end

        def destroy
          # puts last_error
        end

      end
    end
  end
end
