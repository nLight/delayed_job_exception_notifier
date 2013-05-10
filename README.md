# DelayedJobExceptionNotifier

Integrate DelayedJob with ExceptionNotifier. Allows to catch exceptions in background jobs.

## Installation

Add this line to your application's Gemfile:

    gem 'delayed_job_exception_notifier'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install delayed_job_exception_notifier

## Usage

Add to your DelayedJob initializer

    Delayed::Worker.plugins << Delayed::Plugins::ExceptionNotifier

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
