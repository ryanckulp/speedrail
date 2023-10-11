source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

gem 'chartkick'
gem 'delayed' # delayed_job_active_record rails 7 fork: https://github.com/betterment/delayed
gem 'devise'
gem 'figaro', git: 'https://github.com/ryanckulp/figaro' # patched version for Ruby 3.2.0 File.exist?()
gem 'groupdate' # used by Chartkick
gem 'httparty'
gem 'importmap-rails'
gem 'jbuilder'
gem 'metamagic' # easily insert metatags for SEO / opengraph
gem 'pg'
gem 'postmark-rails'
gem 'puma', '6.4.0'
gem 'rack-cors', :require => 'rack/cors'
gem 'rails', '7.1.0'
gem 'redis'
gem 'rename', '1.1.3', git: 'https://github.com/ryanckulp/rename' # remove this gem after use
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'stripe'
gem 'tailwindcss-rails'
gem 'turbo-rails'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop', require: false # code styling
  gem 'rubocop-capybara', require: false
  gem 'rubocop-factory_bot', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

group :development do
  gem 'letter_opener' # view mailers in browser
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails', '6.0.3'
  gem 'selenium-webdriver'
  gem 'shoulda-callback-matchers'
  gem 'shoulda-matchers'
end
