# Speedrail

Libraries included in this rails app (from speedrail boilerplate):
* User authentication via [Devise](https://github.com/plataformatec/devise)
* Design via [Tailwind UI](https://tailwindui.com/)
* Easy user inputs with [simple_form](https://github.com/plataformatec/simple_form)
* Safely store ENV variables with [Figaro](https://github.com/laserlemon/figaro)
* Responsive toggle navbar w/ logic for login, signup, settings
* SEO toolbelt via [metamagic](https://github.com/lassebunk/metamagic)
* Rename your app in 1 command with [Rename](https://github.com/get/Rename)
* Increased debugging power with [Pry](https://github.com/pry/pry) and [Better Errors](https://github.com/charliesome/better_errors)
* Seed your DB in seconds via [Seed Dump](https://github.com/rroblak/seed_dump)
* Production-ready DB setup via postgres
* Google Analytics with Turbolinks support

## Installation
1. Clone the repo
2. `yarn`
3. `gem install bundle && bundle install`
4. `rails g rename:into new_app_name_here`
5. `rails db:setup && rails db:migrate` to create db and included Users table
6. To use Figaro / application.yml, run `bundle exec figaro install`

## Development
```sh
rails s
bin/webpack-dev-server # separate console tab
```

## Notes
using webpack as well as old school Rails asset pipeline to serve images and js/css. learn more [here](https://dev.to/shivashankarror/rails-6-using-images-with-webpacker-and-asset-pipeline-4gk3). examples:

```
/* assume 1.jpeg present in app/javascript/src/images folder */
body{
  background-color: green;
  background-image: url("~1.jpeg");
}

/* assume lake.jpeg present in app/assets/images folder */
div{
  background-color: red;
  background-image: url("~lake.jpeg");
}

# how to call image from app/javascript/src/images/2.jpeg path
<%= image_pack_tag "media/images/2.jpeg" %>

# how to call image present in app/assets/images folder.
<%= image_tag "lake.jpeg" %>
```

## Additional Options
1. New Reg/Sessions controllers override Devise, prepend 'super' to your custom action logic
2. Put your UA-XXX property code for Google Analytics in shared/footer
3. Install Sendgrid add-on (Heroku), visit [settings](https://app.sendgrid.com/settings/tracking) to disable click, open tracking and enable subscription tracking
