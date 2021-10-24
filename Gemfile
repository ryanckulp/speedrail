source 'https://rubygems.org'
ruby '2.7.4'

# basic
gem 'rails', '~> 6.0.2.2'
gem 'uglifier', '>= 1.3.0'
gem 'jbuilder', '~> 2.10.0'
gem 'sdoc', '1.1.0', group: :doc
gem 'sassc-rails'

gem 'bootsnap', '>= 1.4.6', require: false
gem 'listen', '>= 3.0.5', '< 3.2'
gem 'puma', '~> 4.3'
gem 'coffee-rails'
gem 'webpacker'

# speedrail
gem 'font-awesome-rails'
gem 'simple_form'
gem 'devise'
gem 'metamagic' # easily insert metatags for SEO / opengraph
gem 'rails_12factor'
gem 'pg'
gem 'seed_dump' # import / export seed data from existing db (https://github.com/rroblak/seed_dump)
gem 'figaro' # private ENV vars for safe deployment
gem 'rename' # rails g rename:into new_app_name
gem 'rack-cors', :require => 'rack/cors'
gem 'httparty' # external HTTP requests
gem 'stripe' # payments
# gem 'json', '2.6.0'

group :development do
  gem 'web-console', '~> 3.5.0'
  gem 'letter_opener' # view mailers in browser
end

group :development, :test do
  gem 'spring'
  gem 'better_errors'
  gem 'pry'
  gem 'awesome_print'
  gem 'binding_of_caller'
end

group :test do
  gem 'rspec-rails', '~> 3.6.0'
  gem 'spring-commands-rspec'
  gem 'factory_bot_rails', '~> 4.8.0'
  gem 'rails-controller-testing'
  gem 'webdrivers'
  gem 'selenium-webdriver'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'webmock'
  gem 'shoulda-callback-matchers', '~> 1.1.1'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
end
