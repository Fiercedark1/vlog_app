# config/initializers/datadog-tracer.rb
# f = File.new("log/development.log", "w+")
require 'ddtrace'

tracer = Datadog.tracer
sampler = Datadog.configure do |c|
  c.tracer hostname: 'trace-vlog.local'
  c.use :rails, service_name: 'vlog'
  c.tracer sampler: Datadog::RateSampler.new(1)
  c. tracer priority_sampling: Datadog::Ext::Priority::AUTO_KEEP
  c.tracer tags: { 'env' => 'rubyrails' }
#  c.tracer priority_sampling: true
#  c.tracer log: Logger.new(f)
end
#Datadog.configure do |c|
#  c.use :rails, service_name: 'vlog'
#end
#Rails.configuration.datadog_trace = {
#  auto_instrument: true,
#  auto_instrument_redis: true,
#  default_service: 'vlog'
#}
