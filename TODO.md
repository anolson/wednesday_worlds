### For next release

* This week/next week for ride/routes view (done)
* Routes copy (done)
* Remove unused views
* Misc css updates

### Framework

* Convert to Rspec
* Update to Rails 4.

### Refactor

* Pull a Recurrence class out of Occurrence
* Use draper for presenter code
* Pull admin/notifier into different engines.

### Misc

* Add a timeline view of all routes/occurences

### Simplify domain model

* Drop occurrences table, remove Occurrence model.

* Update rides table, Update Route model
  * Add route_id
  * Add begins_at
  * Drop name
  * Drop location
  * Drop curently_active

* Update routes table, Update Route model
  * Drop ride_id

* Add a rake task that creates rides for an entire year
  * Accept a single date as input
  * Create a template that represents a year of rides.
  * Populate rides based on this template and initial date.
