# Cinema Books
*Web Application coursework project.*



### Description
Cinema books is a website specifically for making and managing film showings. Admins can manage them. Users can browse films and showings, then book and view their bookings on their user page.

------------
### Versions
- Rails: 5.2.4.4
- Ruby: 2.7.1p83
	- Additional Gems:
		- haml-rails: 2.0.1
		- jquery-rails: 4.4.0
		- rails-controller-testing: 1.0.5
		- sprockets-rails: 3.2.2
		- devise: 4.7.3
		- bootstrap: 4.5.3
		- json: 2.3.0
- [Jquery Seat Charts (MIT License)](https://www.jqueryscript.net/chart-graph/Full-featured-Seating-Chart-Plugin-With-jQuery-Seat-Charts.html "Jquery Seat Charts")

------------
### Setup
1. Download code or clone this repository
2. Run **bundle install**
3. Run **rails db:migrate**
4. Run **rails db:seed**
5. Run **rails s**
Now it should be up and running at localhost:3000.

------------
#### Admin
Admins have the abililty to manage the creation, deletion and editing of each Film, Showing, Room and User details. Bookings cannot be edited, only created and destroyed.
You can find each management page at ~/admin, where ~ is the model (i.e. showings, bookings, films).
#### User
A user can edit their profile, view showings and film pages, make bookings for showings and use the contact form. They can also view their user page to see all the bookings they have made. They are not allowed to access any management pages
#### Guest
Guests can view showings, films and booking pages, but are not able to make bookings; you must be signed in to do this.
### Tests
Each model, mailer and controller has their own tests. All tests are run using the command below. 
```
rake test
```

#### Models
- User
- Showing
- Film
- Room
- Booking
- Seat
