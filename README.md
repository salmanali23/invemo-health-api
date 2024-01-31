
# Invemo Health API

## Functional Requirements


* This application tracks a patient from lead through being treated. The user would vy a doctors admin.
*  Add Member button brings up a modal form to add patients or doctors (same data for eac, different role)
* Add Opportunity button brings allows user to add a new opportunity record for any patient in the database (can be inline or modal)
* The opportunity starts in Stage "Lead" and progresses to Qualified, Booked, Treated by pressing a Next Stage button on the card
* The stage and associated date/time that the opportunity moved to that stage is recorded in stage history
* User can edit Opportunity procedure name, doctor and stage history(dates and delete stages entirely) inline or modal
* Fuzzy search by patient or doctor name or procedure

### Built with


* [Ruby](https://www.ruby-lang.org/en/)

* [Ruby on Rails](https://rubyonrails.org/)

* [PostgreSQL](https://www.postgresql.org/)

* [RSpec](https://github.com/rspec/rspec-rails)

### Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

*  `ruby 3.1.1`

*  `rails 7.1.0`

### Installation

1. Clone the repo and cd into it
	```
	git clone https://github.com/salmanali23/invemo-health-api
	cd invemo-health-api
	```
2. Install the gems
	`bundle install`

3. Setup the Database
	`rails db:create`
  `rails db:migrate`

4. Start the server
	`rails s`

5. Run test suits
	`rspec`
## Postman Collection

To explore the API endpoints of Invemo Health API, you can use the provided Postman collection. This collection includes pre-configured requests for all the available endpoints.

- **Access the Collection**: [Invemo Postman Collection](https://drive.google.com/file/d/1TegK6wg1ZoqRbwsygMEsyM5hB_K-Qrec/view?usp=sharing)
