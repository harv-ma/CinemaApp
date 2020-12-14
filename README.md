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

Once you download or clone the repository, everything should be good to go. Dumby data is already added. If you want to wipe the data, run `rake db:drop db:create db:migrate` then `rake db:seed`.

Now it should be up and running at localhost:3000.

------------
#### Admin
Admins have the abililty to manage the creation, deletion and editing of each Film, Showing, Room and User details. Bookings cannot be edited, only created and destroyed.
You can find each management page at ~/admin, where ~ is the model (i.e. showings, bookings, films).

*Creds:* admin@example.com
	 password

#### User
A user can edit their profile, view showings and film pages, make bookings for showings and use the contact form. They can also view their user page to see all the bookings they have made. They are not allowed to access any management pages

*Creds:* user@example.com
	 password

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

#### Code Mentions
*Custom JS:* `showing-book`, `showing-index`, these take care of: using AJAX to book seats using Jquery Seats chart to book seats with live updates, and to setup the slider on the showing index page, respectively.

*Seat Layouts:* the `seat-layouts.json` contains each format for room layouts, if you want more they can be easily added to this file just give a different name. They must conform to the symbols: s - standard seat, d - disabled seating, _ - for the walkways.

#### P.S.
If you have lots of deprecation warnings in your console, caused by ruby 2.7, you can run `export RUBYOPT='-W:no-deprecated'` to disable these warnings for the console session.

