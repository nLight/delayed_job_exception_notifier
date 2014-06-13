require 'spec_helper'
require 'delayed_job'
require 'exception_notification'
require 'delayed_job_exception_notifier'

class TestJob
  def perform
    raise StandardError, "Test message"
  end
end

describe DelayedJobExceptionNotifier do
  let(:worker) { Delayed::Worker.new }
  let(:test_job) { Delayed::Job.new payload_object: TestJob.new }
  
  it "works" do
    Delayed::Worker.backend = :dummy
    Delayed::Worker.max_attempts = 1
    Delayed::Worker.delay_jobs = false
    Delayed::Worker.plugins << Delayed::Plugins::ExceptionNotifier
    worker.name = "dummy"

    expect(::ExceptionNotifier).to receive(:notify_exception)

    worker.run(test_job)
  end
end
