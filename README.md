# Rails SQL Injections

Demo of Rails SQL Injections and instructions on how to prevent them.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

- Ruby >= 3.1.2
- PostgreSQL >= 14.4

### First run

1. Run `bundle` to install all gems.

1. Create `.env` file from the `.env.template`.

1. Insert your DB username and password into `.env` file.

1. Run `rails db:setup` to setup the database.

1. Run `rake secret` and insert the secret key into `.env` file.

1. Run `rails s` to start the application.

1. Open `http://localhost:3000/` in your browser and you will see the app.

Optional:

- To run the app in other port, use `bundle exec puma -C config/puma.rb -b tcp://127.0.0.1:3001`.

## Codestyle

[Ruby coding style guide](https://github.com/rubocop-hq/ruby-style-guide)

## License

[GNU General Public License v3.0](LICENSE)
