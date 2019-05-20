# Urban Airship Tags

This script is something that I created to easily generate a full list of the available Tags on [Urban Airship](https://www.airship.com) for the various Tag Groups. At the time of writing this there was no easy way to view the list of Tags through the Urban Airship web interface.

Check out the [Urban Airship docs](https://docs.airship.com/guides/audience/tags-named-users/#overview) for more information on Urban Airship Tags and Tag Groups.


## Setup

1. Setup `rbenv` and install Ruby 2.5.3. This script should work with current versions of Ruby, so this step might not be necessary.

    ```bash
    $ brew install rbenv
    $ rbenv install 2.5.3
    $ ruby --version
    ```

2. Install the `bundler` gem and use it to install the dependencies listed in the `Gemfile`. If you're using Ruby 2.6+ you should just be able to run `bundle install` since the `bundler` gem is now one of the standard gems shipped with Ruby.

    ```bash
    $ gem install bundler
    $ bundle install
    ```

3. Copy the `.env.sample` file to `.env`.

    ```bash
    $ cp .env.sample .env
    ```
 
4. Setup the `.env` file with the configuration for your Urban Airship project. In the Urban Airhsip dashboard, navigate to **Settings > APIs & Integrations** and copy the `App Key` and `App Master Secret` values into the `.env` file you just created.

5. Now that your environment is configured, all that's left is to run the script:

    ```bash
    $ ruby urban_airship.rb
    ```
