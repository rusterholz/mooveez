# mooveez

A simple JSON API for serving up movie information, built on Rails 5 and Ruby 2.6.

This is Andy Rusterholz's solution to the Aetna Code Test.

## Gems Used

In addition to the gems included with a standard Rails API, the following gems were used to facilitate this project:

* [JBuilder](https://github.com/rails/jbuilder) (for views)
* [Kaminari](https://github.com/kaminari/kaminari) (for pagination)
* [Multiverse](https://github.com/ankane/multiverse) (for multiple database management)
* [JSON Expressions](https://github.com/chancancode/json_expressions) (for testing)
* [Shoulda](https://github.com/thoughtbot/shoulda) (for testing)

## Configuration

This project accepts a single environment variable, DATA_PATH, which can be used to specify a path to the directory containing the movies.db and ratings.db files. If it is not set, it defaults to the `/db` folder included in the project (which contains a copy of the files provided with the code test materials).

## Usage

This API exposes four paths:

* **GET /movies** – Returns an index of all movies, ordered by release date. Accepts the following parameters:
  * `page` – selects a different page of results (50 results per page).
  * `direction` – if set to "desc", the list will be returned in reverse order (most-recent-first).
  * `year` – limits results to movies released in the given year.
  * `genre` – limits results to movies in the given genre. Case insensitive, but must match exactly (e.g. for Sci-Fi movies, you must pass `genre=Science%20Fiction`).
* **GET /movies/:id** – Shows details for a particular movie.
* **GET /movies/year/:year** – An alternate way to filter movies by year. Accepts the same `page`, `direction`, and `genre` parameters as the index.
* **GET /movies/genre/:genre** – An alternate way to filter movies by genre. Accepts the same `page`, `direction`, and `year` parameters as the index.


## Notes

This API has a number of differences as compared to an out-of-the-box project generated from `rails new --api`:

* Unused portions of the Rails framework have been disabled and removed: ActiveJob, ActiveStorage, ActionMailer, and ActionCable.

* Rather than a single primary database, this API is built on two independent databases: the movies.db and ratings.db files provided as part of the test materials. The [Multiverse](https://github.com/ankane/multiverse) gem is used to juggle different databases for different ActiveModel records.

* Both of the important models (Movies and Ratings) are read-only. This is enforced by disabling ActiveRecord methods that would insert, update, or delete records. This means that the project doesn't need database migrations or a schema.rb file, as it never modifies the database files that were initially provided. It also means that no separate test database is required, which speeds up test execution.

