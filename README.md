

# WishList


# Installation
## Prerequisites
- [Ruby](https://rvm.io/)
- [PostgreSQL](https://www.postgresql.org/)
- [Redis](https://redis.io/)

## Installation
- Install GEM dependencies:
  ```bash
  bundle install
  ```

- Create database, migrate tables and run the seed data:
  ```bash
  rails db:create
  rails db:migrate
  rails db:seed
  ```

- If you are setting up again, when you already have previous databases:
  ```bash
  rails db:reset
  ```
  `reset` is equivalent of `rails db:drop & rails db:setup`.

# LICENSE
````
MIT License

Copyright (c) 2022 Addisu Haile
