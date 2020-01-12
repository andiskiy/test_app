# Test-App

This is a RoR test application, which can work with external applications.

API is secured by jwt-tokens by using devise and devise-jwt gems.

To authorize in app you should send the request which will return the JWT-token on Header. Then use this token on headers of each request. 

The API can be scaled later by adding v2 version. 

## Used technologies

* Rails 6.0.2.1
* Ruby 2.7.0
* PostgreSQL
* Puma
* Authorization: `Devise`, `Devise-JWT` 

## Getting Started

Install [RVM](https://rvm.io/) with Ruby 2.7.0.


Copy:
```
cp config/database.yml.example config/database.yml
```
For `config/database.yml` update your `username/password`

Add rails credentials: `devise_jwt_secret_key`
```
EDITOR=nano rails credentials:edit
```

Install gems:
```
gem install bundler
bundle install
```

##### Install DB

```
rake db:create
rake db:migrate
rake db:seed
```
