# EffectiveDonate 
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

### Initializing the database: 
```
rails db:create
rails db:migrate
rails db:seed 
```

## Testing 
This backend uses the [Minitest suite](https://github.com/seattlerb/minitest) for unit and functional testing purposes. These test files can be viewed or edited in the `/test` directory. 

You can run all of the tests with `rails test`. 

Or you can run individual test files using the following syntax: `ruby -I test test/controllers/projects_controller_test.rb`

## Data Sources
EffectiveDonate uses a PostgreSQL database, and calls [GlobalGiving's API](https://www.globalgiving.org/api/) for all project-level data. 

The main data fetch occurs in the `Project` model's `fetch` method. This action fetches GlobalGiving's active projects endpoint, which returns a JSON object of 10 projects. The `fetch` method creates an instance of the `Project` object for each of the 10 returned projects, and also uses the project's attributes to create a new `Organization`, `Theme`, or `Country` object, if it doesn't already exist. Thus, all API data can be loaded into EffectiveDonate's backend through this single action. 

Since GlobalGiving's API contains thousands of projects but can only return 10 at a time, the `fetch` method is recursively called until it has looped through the entire list of projects. 

### Refreshing Data
To ensure that only active projects are included in EffectiveDonate's database, the project data must be refreshed regularly. In the `lib/tasks` directory, there is a file called `scheduler.rake`. This rake file contains the task: `fetch_projects`, that deletes all `Project`s, and then fetches new ones into the database. 

To keep my Heroku-deployed production data fresh, I use a Heroku addon called [Heroku Scheduler](https://elements.heroku.com/addons/scheduler). The scheduler runs the `fetch_projects` rake task every day. 

## Technologies Used
* [Rails](https://github.com/rails/rails) - MVC Application Framework
* [PostgreSQL](https://www.postgresql.org/) - Relational Database Management System
* [JWT](https://github.com/jwt/ruby-jwt) - Server-side User Authorization 
* [Bcrypt](https://rubygems.org/gems/bcrypt/versions/3.1.12) - Password Hashing
* [REST Client](https://rubygems.org/gems/rest-client/versions/1.8.0) - HTTP and REST Client
* [DotENV](https://rubygems.org/gems/dotenv-rails/versions/2.1.1) - Environment Variables
