[ ![Codeship Status for dfmoreto/onebitcode_exchange](https://app.codeship.com/projects/1cc69cf0-83d9-0135-9473-62a24314a0c3/status?branch=master)](https://app.codeship.com/projects/247370)

# Check Exchange

This is an app to help people on Currency Conversion.

On it, it's possible to choose a Currency you want to convert and quantity of it you want.
And it's also possible to request this conversion to be sent to your email.

![Main view](https://github.com/dfmoreto/onebitcode_exchange/blob/master/public/main_view.png)


## What are we using?

It's an app built in Ruby on Rails framework and we are using some additional technologies:
- Docker
- Docker compose
- RSpec
- Capybara
- JQuery
- Codeship
- Heroku
- MailGun integrated with Heroku


# How can I run this?

It's very simple.

You only need to build containers using command `docker-compose build` on root of project and then start your containers with `docker-compose up`
