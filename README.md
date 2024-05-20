# Speedrail
a Rails 7 template by [@ryanckulp](https://twitter.com/ryanckulp), created to ship SaaS apps quickly. 

learn to build 3 projects with Speedrail at [24 Hour MVP](https://founderhacker.com/24-hour-mvp), or check out the [premium documentation](https://gitpaywall.com/p/ryanckulp/speedrail-docs).

**Speedrail features**
* rich text blog CMS
* embedded subscription payment portal via [Stripe Checkout](https://docs.stripe.com/payments/accept-a-payment?platform=web&ui=embedded-form)
* built-in referral marketing via [Rewardful](https://www.rewardful.com/?via=speedrail)
* admin panel with Tailwind CSS via [Active Admin](https://github.com/activeadmin/activeadmin/)
* user authentication via [Devise](https://github.com/plataformatec/devise)
* A/B testing with [Split](https://github.com/splitrb/split/)
* design via [Flowbite](https://flowbite.com/) and [Tailwind UI](https://tailwindui.com/)
* SEO toolbelt via [metamagic](https://github.com/lassebunk/metamagic)
* responsive and mobile friendly navigation
* beautiful code coverage GUI via [SimpleCov](https://github.com/simplecov-ruby/simplecov) and [TailwindCov](https://github.com/chiefpansancolt/simplecov-tailwindcss)
* rename your app in 1 command with [Rename](https://github.com/get/Rename)
* debugging with [Better Errors](https://github.com/charliesome/better_errors)
* production-ready DB with Postgres
* easy API requests with [HTTParty](https://github.com/jnunemaker/httparty)
* Postmark for transactional emails, [letter_opener](https://github.com/ryanb/letter_opener) for local preview
* script tag GUI (for Google Analytics, etc)
* testing suite via [RSpec](https://github.com/rspec/rspec-rails/)
* cron job task scheduler (`lib/tasks/scheduler.rake`)
* random data generation with [Faker](https://github.com/faker-ruby/faker)
* Heroku <> Cloudflare HTTPS via `lib/cloudflare_proxy.rb`
* background job queue via [Delayed](https://rubygems.org/gems/delayed)
* interactive charts via [Chartkick](https://chartkick.com)
* automated testing via GitHub actions + PR status check
* Rubocop for code style enforcement and linting auto-fixes

## Installation
1. clone the repo
2. `speedrail/bin/speedrail new_app_name`
3. inspect, then save/close the generated credentials file
4. `cd new_app_name`

**For detailed, step by step tutorials to using Speedrail, get lifetime access to the [Speedrail Docs](https://gitpaywall.com/p/ryanckulp/speedrail-docs) for a one-time fee of $49.**

## Development
```sh
bin/dev # uses foreman to boot server, frontend, and bg job queue
```

To sync your project with the latest Speedrail improvements:

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

## Testing
```sh
# headless
bundle exec rspec # run all tests inside spec/
bundle exec rspec spec/dir_name # run all tests inside given directory

# headed (in a real browser)
HEADED=TRUE bundle exec rspec
```

## Code Quality

clean code keeps projects manageable as they grow in complexity.

```sh
rubocop # checks your code against Ruby styling standards and calls out issues
rubocop -A # automatically fixes issues, can lead to false negatives
rubocop -a # automatically fixes "safe" issues, less aggressive than -A (uppercase)
```

**Rubocop is an optional feature**, however it runs automatically during GitHub CI checks. if you don't want to enforce the Rubocop style guide, simply disable the `Rubocop Check` step inside `ci.yml`.

## Contributing
anyone is welcome to submit a PR with improvements of any kind.
