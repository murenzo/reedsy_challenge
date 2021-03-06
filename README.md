# REEDSY MERCHANDISING STORE API

## PROFESSIONAL SUMMARY
Result-oriented software engineer with expertise in building secure and robust enterprise applications, I have been developing professionally for over 9 years using PHP, Ruby, Python and Javascript. An excellent team player with a positive attitude. Seeking a role in an environment that will avail me the opportunity to work on solving global challenges and also play a part in my local ecosystem. I do enjoy watching Football, Movies, and playing Games when I am free.

### Prerequisites

* Ruby version (2.7.5)

* A running instance of postgressql

### Quick setup

1 Run `bundle` in the root directory of the project after cloning it

2 Run `rails db:setup` command to create the database, load the schema, and initialize it with the seed data.

3 Run `rspec` command to run all test or simply specify the path to the test file of interest `rspec spec/services/app_services/hoodie_discount_service_spec.rb`

### Product Price Services

* The discount option for the respective product price services are been enabled by default when we call a product price service. E.g. `MugPriceService.call(['MUG', 'TSHIRT', 'HOODIE'])`
* If we want to disable the discount from been applied to the the original total price, we will need to pass a `false` value as second parameter when calling a product price service. E.g. `MugPriceService.call(['MUG', 'TSHIRT', 'HOODIE'], false)`

### Download Postman Exported JSON file.

You can download the Postman exported JSON file [here](https://github.com/murenzo/reedsy_challenge/blob/main/public/Reedsy_Merchandising_Store_API.postman_collection.json)
