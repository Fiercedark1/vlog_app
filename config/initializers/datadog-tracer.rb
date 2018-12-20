# config/initializers/datadog-tracer.rb
require 'ddtrace'
f = File.new("log/development.log", "w+")
sampler = Datadog::RateSampler.new(1)
Datadog.configure do |c|
  c.tracer hostname: 'trace-vlog.local'
  c.use :rails, service_name: 'ruby-vlog'
  c.tracer priority_sampling: true
  c.tracer tags: { 'env' => 'datad0g.com' }
  c.tracer log: Logger.new(f)
end
