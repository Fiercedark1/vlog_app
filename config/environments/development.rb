Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  config.web_console.whitelisted_ips = '172.25.0.0/16'
  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true


  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  

  #--------Added by Alex 2/15 ------------ 
  # Lograge config
  config.lograge.enabled = true

  # We are asking here to log in RAW (which are actually ruby hashes). The Ruby logging is going to take care of the JSON formatting.
  config.lograge.formatter = Lograge::Formatters::Raw.new

  # This is is useful if you want to log query parameters
  config.lograge.custom_options = lambda do |event|
    { :@marker => ["sourcecode", "ruby", "rails"],
      #:params => event.payload[:params].reject { |k| %w(controller action).include? k }
    }
  end
  config.colorize_logging = false


  # Set the logging destination(s)
  config.log_to = %w[stdout file]

  # Show the logging configuration on STDOUT
  config.show_log_configuration = true
end
