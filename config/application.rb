require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Speedrail
  class Application < Rails::Application
    config.load_defaults 5.2
    Figaro.load
    config.autoload_paths << Rails.root.join('lib') # adds Lib folder to autoloaded files
    config.autoload_paths += %W(#{config.root}/app/services)

    # allow cross origin requests
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :patch, :put, :delete]
      end
    end

    # sendgrid
    ActionMailer::Base.smtp_settings = {
      :user_name => ENV['SENDGRID_USERNAME'],
      :password => ENV['SENDGRID_PASSWORD'],
      :domain => 'ryanckulp.com',
      :address => 'smtp.sendgrid.net',
      :port => 587,
      :authentication => :plain,
      :enable_starttls_auto => true
    }

    # paperclip
    config.paperclip_defaults = {
      storage: :s3,
      s3_credentials: {
          bucket: ENV['AWS_BUCKET'],
          access_key_id: ENV['AWS_ACCESS'],
          secret_access_key: ENV['AWS_SECRET']
      }
    }

    # disable superfluous generator extras
    config.generators do |g|
      g.assets = false # remove auto stylesheets
      g.helper = true
    end

  end
end
