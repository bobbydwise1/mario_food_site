# _Food Products Review Site_

#### _A basic web application that reviews Food Specialty Products, done in Ruby on Rails._

#### By _Robert Lee_

## Description

_Create a website application that reviews food products, on a 5 point scale.  The database must use a one-to-many schema._

## Setup/Installation Requirements

_Setup requires the installation of Ruby, Rails, and Postgres.  An additional Ruby "gem" file installs additional dependencies:_

* With an internet connection active, clone this repository by typing at the terminal window:

  "$ git clone https://github.com/bobbydwise1/mario-food-site.git
* Navigate to the downloaded repository using the terminal window.
* Your computer must have Ruby installed.  In the terminal window at the working directory of the program, you will need to install some additional Ruby Gems files.  Do this by putting this on the command line while connected to the internet:

  "$ bundle install
* Your computer must have Postgres installed.  To restore the SQL database, type the following commands at the terminal window of the project directory:

  "$ createdb food_review

  "$ psql food_review < my_database.sql

  "$ createdb -T food_review food_review_test
* Start the Postgres server on your local machine.  Do this by going to a new terminal window at the project directory, and typing:

  "$ postgres
  * The terminal window will need to stay open while Postgres is running.
* If Postgres says it can't find the user, you may have to start Postgres as the default install user:

  "$ postgres -U postgres
* If Postgres is asking for a password, enter "123456".
* To run the test cases, type at the terminal: $ rspec
* To run the program itself, go to the command line, and set the current working directory the same as the project's folder.  Type the following at the terminal:

  "$ ruby app.rb
* Afterwards, open your web browser and head to the address https://localhost:3000 to start the application.

## Technologies Used

_Ruby, Rails, Sinatra framework, Bootstrap, Atom, Postgres, SQL , HTML, Git._

## Requirements

#### Database
The site should have functionality to review products so your database should include a one-to-many relationship between Products and Reviews. All products must have a name, cost and country of origin. All reviews should have author, content_body and rating. (A rating can be a number between 1 and 5.) You can include other fields of your choosing as well.

#### Landing Page
The landing page should include basic information about the company and should allow users to easily navigate to other areas of the site. This page should also include the three most recently added products and the product with the most reviews. See more information in the Scopes section below.

#### Products
The site needs to include a products section with a list of the tasty products that Mario sells. Each product should be clickable with a detail view.

Site admins should be able to add, update and delete new products. (Don't worry about user authentication; assume everyone who visits the site is an admin for now).
Users should be able to click an individual product to see its detail page. (You will not be expected to show the product's average rating; that's included in the further exploration section.)
Users should be able to add a review to a product.

#### Scopes
Your site should use scopes to display the following information on the site:

The product with the most reviews.
The three most recently added products.
All products made in the USA for buyers that want to buy local products.
Validations
Your site should include validations for the following:

All fields should be filled out, including rating.
Rating can only be an integer between 1 and 5.
The review's content_body must be between 50 and 250 characters.

#### Seeding
Your project should include seed data for 50 products and 250 reviews. Use Faker with a loop to seed the database.

#### Overall Styling
You'll be demoing this site to the CEO of Mario's Specialty Foods, so it should look presentable.

## Specifications

* The required tests for inputs and outputs are denoted:  TBD


* TBD

## Known bugs

* To be determined.

### License

MIT License

Copyright (c) 2018, _Robert Lee_

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
