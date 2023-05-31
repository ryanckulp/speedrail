source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

gem 'rails', '7.0.5'
gem 'sprockets-rails'
gem 'pg'
gem 'puma', '~> 5.6'
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'tailwindcss-rails'
gem 'jbuilder'
gem 'redis'
gem 'httparty'
gem 'figaro', git: 'https://github.com/ryanckulp/figaro' # patched version for Ruby 3.2.0 File.exist?()
gem 'rename', '1.1.3', git: 'https://github.com/ryanckulp/rename' # remove this gem after use
gem 'delayed' # delayed_job_active_record rails 7 fork: https://github.com/betterment/delayed
gem 'metamagic' # easily insert metatags for SEO / opengraph
gem 'rack-cors', :require => 'rack/cors'
gem 'postmark-rails'
gem 'devise'
gem 'stripe'
gem 'chartkick'
gem 'groupdate' # used by Chartkick

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem 'web-console'
  gem 'letter_opener' # view mailers in browser
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'shoulda-callback-matchers'
  gem 'shoulda-matchers'
  gem 'faker'
end
