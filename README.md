# sparta-openweather-api

## Task
To read an API response from the open weather [API](https://openweathermap.org/) into a class with testable methods, splitting the class into two main services: sigle city search, and multiple city search.

## Requirements
* Ruby (built in 5.1.5)
* The rspec gem
* The JSON gem
* The HTTParty gem

## How to run tests
* `git clone` the HTML link from [here](https://github.com/MoRUddin/sparta-openweather-api) to download the project to your local environment
* run `bundle` to install the rspec, json, and httparty gems
* run `rspec` on the project folder to run the tests

## Main challenges
* understanding how the API works (using the [documentation](https://openweathermap.org/api))
* making the multiple search information available per searched city
* correctly setting up the before hooks for both the single and multiple search contexts
