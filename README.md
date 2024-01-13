# Speedrail
a Rails 7 template by [@ryanckulp](https://twitter.com/ryanckulp), created to ship SaaS apps quickly. Learn how to use this at [24 Hour MVP](https://founderhacker.com/24-hour-mvp).

features:
* user authentication via [Devise](https://github.com/plataformatec/devise)
* design via [Tailwind UI](https://tailwindui.com/)
* user billing management via [Stripe Checkout](https://stripe.com/payments/checkout) portal
* safely manage ENV variables with [Figaro](https://github.com/laserlemon/figaro)
* responsive toggle navbar w/ logic for login, signup, settings
* SEO toolbelt via [metamagic](https://github.com/lassebunk/metamagic)
* rename your app in 1 command with [Rename](https://github.com/get/Rename)
* increased debugging power with [Better Errors](https://github.com/charliesome/better_errors)
* seed your DB in seconds via [Seed Dump](https://github.com/rroblak/seed_dump)
* production-ready DB via Postgres
* easy API requests with [HTTParty](https://github.com/jnunemaker/httparty)
* Postmark for transactional emails, [letter_opener](https://github.com/ryanb/letter_opener) for local dev mailers
* script tag component (Google Analytics, etc)
* testing suite via [RSpec](https://github.com/rspec/rspec-rails/)
* cron job task scheduler (`lib/tasks/scheduler.rake`)
* random data generation with [Faker](https://github.com/faker-ruby/faker)
* Heroku <> Cloudflare HTTPS via `lib/cloudflare_proxy.rb`
* background job queue via [Delayed](https://rubygems.org/gems/delayed)
* paid subscriptions CRUD via [Stripe Checkout](https://stripe.com/checkout)
* interactive charts via [Chartkick](https://chartkick.com)
* automated testing via GitHub actions + PR status check
* Rubocop for code style enforcement and linting auto-fixes

## Installation
1. clone the repo
2. `bin/speedrail new_app_name`
3. `cp config/application-sample.yml config/application.yml` (then add/update ENV vars here)

## Development
```sh
bin/dev # uses foreman to boot server, frontend, and bg job queue
```

To keep your project up-to-date with the latest Speedrail changes over time:

```sh
# one time only
git remote add speedrail https://github.com/ryanckulp/speedrail.git

# when you notice Speedrail updates on GitHub
git pull
git fetch speedrail
git merge speedrail/master --allow-unrelated-histories
git checkout -b speedrail_updates
git add .
git push speedrail_updates
# use GitHub UI to handle conflicts
```

**troubleshooting**

ActionCable - to support WebSockets, run `rails g channel channel_name --assets` then add `mount ActionCable.server => '/cable'` to `config/routes.rb`. update `cable.yml` -> `production:` to include the following for Heroku to connect w/ Redis for `ActionCable.broadcast`:

```rb
ssl_params:
    verify_mode: <%= OpenSSL::SSL::VERIFY_NONE %>
```

`Turbo Drive` lazy-loads pages following form submission, causing script tags at the bottom of following views to not always load.

```html
<!-- add data-turbo=false to form submission buttons if the following view needs a full render -->
<button data-turbo="false" type="submit" ...>Submit</button>
```

## Testing
```sh
# headless
bundle exec rspec # run all tests inside spec/
bundle exec rspec spec/dir_name # run all tests inside given directory

# headed (in a real browser)
HEADED=TRUE bundle exec rspec
```

## Code Quality

clean code helps keep projects manageable as they grow in complexity.

```sh
rubocop # checks your code against Ruby styling standards and calls out issues
rubocop -A # automatically fixes issues, can lead to false negatives
rubocop -a # automatically fixes "safe" issues, less aggressive than -A (uppercase)
```

**Rubocop is an optional feature**, however it runs automatically during GitHub CI checks. if you don't want to enforce the Rubocop styleguide, simply disable the `Rubocop Check` step inside `ci.yml`.

## Deploying
```sh
figaro heroku:set -e production # you only need to do this once
heroku git:remote -a heroku_app_name_here # you only need to do this once
```

```sh
git push heroku master # deploys master branch
git push heroku some_branch_name:master # deploys non-master branch
```

If you get `error: src refspec master does not match any` the probable cause is that you're using a new Github repo which defaults to master being called "main." You can deploy to Heroku using the branch deployment strategy pushing main over master:

```sh
git push heroku main:master
```

or update your Heroku account to also default to main and then deploy with:

```sh
git push heroku main
```

**note**: Heroku must have 2 'dynos' enabled, `web` + `worker`, to process background jobs. if you don't need a queue, simply remove the `worker` task from `Procfile` and don't invoke `.delayed` functions.

## Mailers
Speedrail is configured for transactional mailers by [Postmark](https://postmarkapp.com/), which costs $10 /month for 10k emails. to activate this, set `postmark_api_token` inside `application.yml` and then [verify your sending domain](https://account.postmarkapp.com/signature_domains/initialize_verification).

if you prefer a free email service for low volume applications, consider [Resend](https://resend.com/). before [installing it](https://github.com/resendlabs/resend-ruby#setup), first uninstall Postmark from Speedrail by 1) removing `gem 'postmark-rails'` from the Gemfile, 2) running `bundle`, then 3) deleting the following lines from `application.rb`:

```rb
config.action_mailer.delivery_method = :postmark
config.action_mailer.postmark_settings = { api_token: ENV['POSTMARK_API_TOKEN'] }
```

## Contributing
anyone is welcome to submit a pull request with improvements of any kind.
