# Entertainment Platform
This project provides below API's 
1. An endpoint to return the movies, ordered by creation.
2. An endpoint to return the seasons ordered by creation, including the list of episodes ordered by its number. 
3. An endpoint to return both movies and seasons, ordered by creation.
4. An endpoint for a user to perform a purchase of a content.
5. An endpoint to get the library of a user ordered by the remaining time to watch the content.


### Framework and Library Used

* Ruby version - ruby-2.7.0

* Rails vesrion - 'rails', '5.2.4'

* DataBase - MySQL

* Api Documentation - 'open_api-rswag'

* Pagination - 'will_paginate'

* TDD Library - rspec, factoryBot, Faker

### How to Setup 
1. Clone the repository 
 ```
 git clone git@github.com:Satkar/entertainment_platform.git
 ```
2. Navigate to the project directory
 ```
 cd entertainment_platform
 ```
3. Run below command for up and running project 
 ```
 bin/setup
 ```
  Above command will do following things for you
   ```
   1. Installs system dependencies
   2. Prepares a Database for development and test
   3. Run migrations
   4. Seed the data (Seeding some data for demo purpose)
   5. Run specs
   6. Removing old logs and tempfiles
   7. Starts the application server on port 3000
   ```

### How to run the test suite
 Navigate to project directory and run
 ```
 bundle exec rspec
 ```
  
### How to run the server locally
 Navigate to project directory and run 
 ```
 bin/rails s
 ```

### Api endpoint Open Api Documentation 
  ```
  http://localhost:3000/api-docs/index.html
  ``` 
  Considering your app is running locally on port 3000  
