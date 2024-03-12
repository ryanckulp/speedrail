require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Speedrail
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # allow cross origin requests
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :patch, :put, :delete]
      end
    end

    # background jobs
    config.active_job.queue_adapter = :delayed

    # mailers via postmark
    config.action_mailer.default_url_options = { host: ENV['BASE_URL'] }
    config.action_mailer.default_options = { from: ENV['ADMIN_EMAIL'] }
    config.action_mailer.delivery_method = :postmark
    config.action_mailer.postmark_settings = { api_token: ENV['POSTMARK_API_TOKEN'] }

    # serve images from asset pipeline in mailers
    config.asset_host = ENV['BASE_URL']

    # customize generators
    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
      g.view_specs = false
      g.helper_specs = false
      g.assets = false # stylesheets
      g.helper = true
    end
  end
end
