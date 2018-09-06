source 'https://rubygems.org'
ruby '2.3.7'

# included
gem 'rails', '~>  5.2.0'
gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

# 5.2 Upgrade
gem 'bootsnap', '>= 1.1.0', require: false
gem 'listen', '>= 3.0.5', '< 3.2'
gem 'puma', '~> 3.11'

# speedrail
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
gem 'font-awesome-rails'
gem 'simple_form'
gem 'jquery-turbolinks'
gem 'devise'
gem 'gravatarify', '~> 3.0.0'
gem 'metamagic' # easily insert metatags for SEO / opengraph
gem 'rails_12factor'
gem 'pg'
gem 'bootstrap-sass'
gem 'paperclip', '~> 5.2.0' # incomplete setup - must add resource to existing model
gem 'aws-sdk' # configure in config/application.rb
gem 'seed_dump' # import / export seed data from existing db (https://github.com/rroblak/seed_dump)
gem 'figaro' # private ENV vars for safe deployment
gem 'rename' # rails g rename:into new_app_name
gem 'rack-cors', :require => 'rack/cors'

group :development do
  gem 'web-console', '~> 3.5.0'
end

group :development, :test do

  # included
  gem 'spring'

  #speedrail
  gem 'foreman'
  gem 'better_errors'
  gem 'pry'
  gem 'awesome_print'
  gem 'binding_of_caller'

end
