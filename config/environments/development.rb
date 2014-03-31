WebApp::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local   = true
  config.action_controller.perform_caching = false

  config.action_mailer.raise_delivery_errors = true 
  # steps for testing mail sending in dev
  # we should not put mailcatcher in the gem file
  # as it will screw up the versioning
  # 1. gem install mailcatcher
  # 2. mailcatcher
  # 3. Go to http://localhost:1080/
  # 4. Send mail through smtp://localhost:1025
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {:address => "localhost", :port => 1025}

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  #default url options
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
end
