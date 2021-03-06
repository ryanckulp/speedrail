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

    # sendgrid
    ActionMailer::Base.smtp_settings = {
      user_name: ENV['SENDGRID_USERNAME'],
      password: ENV['SENDGRID_PASSWORD'],
      domain: 'speedrail.com',
      address: 'smtp.sendgrid.net',
      port: 587,
      authentication: 'plain',
      enable_starttls_auto: true
    }

    # paperclip - file uploads
    config.paperclip_defaults = {
      storage: :s3,
      s3_credentials: {
        bucket: ENV['AWS_BUCKET'],
        access_key_id: ENV['AWS_ACCESS'],
        secret_access_key: ENV['AWS_SECRET']
      }
    }

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
