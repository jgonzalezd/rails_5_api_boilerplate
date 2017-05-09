# Boilerplate Rails 5 API only Application with JWT authentication with revocation strategy and Devise.

This is fresh start for an Rails 5 API that includes testing framework setup with Rspec, Factory Girl, DB Cleaner. 

It uses the [devise-jwt] (https://github.com/waiting-for-dev/devise-jwt) which implements JWT (Json Web Token) revocation [discussed here](http://waiting-for-dev.github.io/blog/2017/01/23/stand_up_for_jwt_revocation/)

## Set Up

1. Configure Database

    Out of the box it uses PostgreSql DB. For this reason you need to have PostgreSql installed and permissions for create DB

2. run `bundle install`
3. Run migrations `rails db:migrate`
4. Run `rails server`

## Requests

You can see sample [Postman](https://www.getpostman.com/) requests under directory `sample_requests`

### Registrations

```
POST /api/v1/users HTTP/1.1
Host: localhost:3000
Content-Type: application/json
Cache-Control: no-cache
Postman-Token: 3b86f9c1-3c60-3612-7de6-2e19eb6ac5ed

{
  "user": {
    "email": "test@example.com",
    "password": "anewpassword",
    "password_confirmation": "anewpassword"
  }
}
```

### Log in

```
POST /api/v1/users/sign_in HTTP/1.1
Host: localhost:3000
Content-Type: application/json
Cache-Control: no-cache
Postman-Token: d9f5fd9d-83e8-97bf-d8c2-abd8f340963c

{
  "user": {
    "email": "test@example.com",
    "password": "anewpassword"
  }
}
```

