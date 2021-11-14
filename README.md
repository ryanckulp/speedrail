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
* Postmark for transactional emails
* Google Analytics with Turbolinks support

## Installation
1. Clone the repo
2. `yarn`
3. `gem install bundle && bundle install`
4. `rails g rename:into new_app_name_here`
5. `rails db:setup && rails db:migrate` to create db and included Users table
6. `bundle exec figaro install` to put ENV vars in `config/application.yml`

## Development
```sh
rails s
bin/webpack-dev-server # separate console tab
```

## Notes
Turbolinks behavior for same-page anchors.

```
<!-- if you have event listeners on anchor tags, Turbolinks will trigger a page reload on click -->
data-turbolinks="false"
<!-- add this attribute to elements to avoid this behavior -->
```

Rails 6 and Webpack changes to know about.

```scss
/* styles in app/javascript/src/stylesheets/_custom.scss (assumes image.jpeg in app/javascript/images) */
body{
  background-color: green;
  background-image: url("~image.jpeg"); // '~' tilda required
}
```

```erb
<!-- how to call image from app/javascript/images path (assumes image.jpeg in app/javascript/images) -->
<%= image_pack_tag "image.jpeg" %>
```

## Additional Options
1. use Postmark for emails. set `postmark_api_token` inside `application.yml`, `from` address inside `application.rb` / `application_mailer.rb`, then [verify your domain](https://account.postmarkapp.com/signature_domains/initialize_verification)
2. put Google Analytics snippet in `shared/footer`
3. new Reg/Sessions controllers override Devise, prepend `super` to your custom action logic
