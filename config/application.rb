require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Speedrail
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # allow cross origin requests
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :patch, :put, :delete]
      end
    end

    # mailers via postmark
    config.action_mailer.default_url_options = { :host => ENV['base_url'] } # TODO: set 'base_url' in application.yml!
    config.action_mailer.default_options = { from: 'support@speedrail.com' }
    config.action_mailer.delivery_method = :postmark
    config.action_mailer.postmark_settings = { api_token: ENV['postmark_api_token'] }

    # customize generators
    config.generators do |g|
      g.test_framework  :rspec, :fixture => false
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
      g.view_specs = false
      g.helper_specs = false
      g.assets = false # stylesheets
      g.helper = true
    end
  end
end
