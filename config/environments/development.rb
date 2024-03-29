WebApp::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

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
  config.action_mailer.raise_delivery_errors = true

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  #default url options
  config.action_mailer.default_url_options = { :host => 'http://localhost:3000/' }

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  config.action_mailer.delivery_method = :smtp

  # mailer config for gmail
 # config.action_mailer.smtp_settings = {
  #  address: "smtp.gmail.com",
  #  port: 587,
  #  domain: ENV["GMAIL_DOMAIN"],
  #  authentication: "plain",
  #  enable_starttls_auto: true,
  #  user_name: ENV["GMAIL_USERNAME"],
  #  password: ENV["GMAIL_PASSWORD"]
  #}

  # development settings for using mailcatcher gem
  config.action_mailer.smtp_settings = {
    address: "localhost",
    port:    1025,
    domain:  'lvh.me:3000'
  }

  ENV["TEST_ENV_AUTO_CONFIRM"] = "true"


  Paperclip.options[:command_path] = "C:/Program Files/ImageMagick-6.8.9-Q16"

end
