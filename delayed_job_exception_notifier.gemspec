# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'delayed_job_exception_notifier/version'

Gem::Specification.new do |spec|
  spec.name          = "delayed_job_exception_notifier"
  spec.version       = DelayedJobExceptionNotifier::VERSION
  spec.authors       = ["Dmitriy Rozhkov"]
  spec.email         = ["rojkov.dmitry@gmail.com"]
  spec.description   = %q{Plugin for integration ExceptionNotifier with DelayedJob}
  spec.summary       = %q{}
  spec.homepage      = "https://github.com/nLight/delayed_job_exception_notifier"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_runtime_dependency "delayed_job", "~> 4"
  spec.add_runtime_dependency "exception_notification", "~> 4.0"
end
