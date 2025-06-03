# README
### System dependencies
  ```
    Ruby 3.4.4
    Postgres 16.9
    Rails 8.0.2
  ```
You will need to install these three in order to run the server
#### Ruby
  
For Ruby installation i suggest either [RBenv](https://github.com/rbenv/rbenv#readme) or [Mise](https://mise.jdx.dev/lang/ruby.html).

#### Postgres

For installing posrgres their [Official install guide](https://www.postgresql.org/download/linux/ubuntu/) should suffice.

Run `sudo service postgresql start` in order to ensure that your local posrgres is running

#### Bundler
Make sure to install bunder via `gem install bundler`

### Configuration
Updating the database.yml
Make sure to update your [database.yml](https://github.com/JohnPaulRicarse/KeyhookTechTest/blob/main/config/database.yml) to use your postgres credentials.

```
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  user: UPDATE_THIS_USER
  password: UPDATE_THIS_PASSWORD
```

#### Database Creation
```
  rails db:create
  rails db:migrate
```
There are seeds that you can run if you want to have a seeded database
```
  rails db:seed
```

#### Running Tests

```
  rspec spec
```

#### Running the Server
In order to run the server you have to use
```
bin/dev
```

and a rails server should be running at `http://127.0.0.1:5000/`
