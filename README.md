# Sample Rails App with Couchbase Cache

![Couchbase Capella](https://img.shields.io/badge/Couchbase_Capella-Enabled-red)
[![License: MIT](https://cdn.prod.website-files.com/5e0f1144930a8bc8aace526c/65dd9eb5aaca434fac4f1c34_License-MIT-blue.svg)](/LICENSE)
![Static Badge](https://img.shields.io/badge/Code_of_Conduct-Contributor_Covenant-violet.svg)

This is a sample Rails app that demonstrates how to use Couchbase as a cache store in a Rails application. The app simply caches the current time in the cache store and displays it on the home page.

You can clone this repository, and use it as the template for your Rails application that uses Couchbase as a cache store.

Couchbase Capella is a database as a service, which you can use as your cache store. It is free to try and you can sign up for a free account at [Couchbase Capella](https://cloud.couchbase.com/).

## Installation

To install the app, follow these steps:

1. Clone the repository:

   ```bash
   git clone https://github.com/hummusonrails/couchbase-rails-caching.git
   ```

2. Change to the app directory:

   ```bash
    cd couchbase-rails-caching
    ```

3. Install the dependencies:

    ```bash
    bundle install
    ```

4. Start the Rails server:

    ```bash
    bundle exec rails s
    ```

5. Open your browser and navigate to `http://localhost:3000/` to see the current time displayed on the home page.

## Configuration

The app uses the `couchbase` gem to connect to Couchbase and using it as the cache store. The configuration for setting up Couchbase as the cache store is found in the `config/application.rb` file. You can modify this file to change the configuration settings for the Couchbase connection.

Here is the configuration for setting up Couchbase as the cache store:

```ruby
config.cache_store = :couchbase_store, {
    connection_string: env.fetch("COUCHBASE_CONNECTION_STRING"),
    username: env.fetch("COUCHBASE_USER"),
    password: env.fetch("COUCHBASE_PASSWORD"),
    bucket: env.fetch("COUCHBASE_BUCKET"),
}
```

You can modify the connection string, username, password, and bucket name to match your Couchbase configuration. The values for these settings are read from the environment variables `COUCHBASE_CONNECTION_STRING`, `COUCHBASE_USER`, `COUCHBASE_PASSWORD`, and `COUCHBASE_BUCKET`. The sample `.env.example` file contains the sample values for these environment variables. Rename this file to `.env` and set the actual values for these environment variables.

## Usage

The app simply caches the current time in the cache store and displays it on the home page. The cache key is set to `current_time` and the cache expiry is set to 1 minute. The cache key and expiry settings are found in the `app/controllers/home_controller.rb` file. You can modify these settings to change the cache key and expiry time.

All of the functionality available in `ActiveSupport::Cache::Store` is available in the `CouchbaseStore` as well. You can use the `Rails.cache` object to interact with the cache store in your Rails application.

```ruby
Rails.cache.fetch("current_time", expires_in: 1.minute) do
    Time.current.to_json
end
```

You can use the `Rails.cache.fetch` method to fetch the value from the cache store. If the value is not found in the cache store, the block is executed and the value is stored in the cache store with the specified expiry time.

## Code of Conduct

Everyone interacting with this project is expected to follow the [Code of Conduct](CODE_OF_CONDUCT.md).

## License

The app is available as open source under the terms of the [MIT License](LICENSE).
