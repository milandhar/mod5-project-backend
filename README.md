#EffectiveDonate 
A nonprofit discovery and donation tool, using data from [GlobalGiving's API](https://www.globalgiving.org/api/)

EffectiveDonate allows users to filter active projects by theme and find them on a world map (desktop). It also enables users to save their favorite projects.

View the website in production [here](https://effectivedonate.herokuapp.com/).
View frontend repo [here](https://github.com/milandhar/mod5-project-frontend).

## Getting Started

### Installing 
First, make sure you have [Rails 5 Installed](https://guides.rubyonrails.org/v5.0/getting_started.html#installing-rails). 
To install the Rails backend locally, follow these steps: 
* Clone this repository: 
```
git clone https://github.com/milandhar/mod5-project-backend.git
cd mod5-project-backend
```

* Install dependencies using Bundler: 
`bundle install`

* Initialize the database: 
```
rails db:create
rails db:migrate
rails db:seed 
```

## Testing 
This backend uses the [Minitest suite](https://github.com/seattlerb/minitest) for unit and functional testing purposes. These test files can be viewed or edited in the `/test` directory. 

You can run all of the tests with `rails test`. 

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
