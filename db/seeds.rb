# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# test = Customer.where(phonenumber: '12345678').first
# test.delete if test

#  export RUBYOPT='-W:no-deprecated'

#
#   DB Must be dropped before seeding, as for
#   foreign key constraints to succeed order matters
#   edit: can remove deletions for updated instead


# customers = Customer.create([
#     forename: 'Harvey',
#     surname: 'M-A',
#     phonenumber: '12345678',
#     email: 'hm00929@surrey.ac.uk',
#     password: 'test'
# ])

# Film Seeds
# test = Film.where(title: 'Weathering With You').first
# test.delete if test

film1 = Film.create(
    title: 'Weathering With You',
    synopsis: 'A boy runs away to Tokyo and befriends a girl who appears to be able to manipulate the weather.',
    rating: 10,
    language: 'Japanese',
    duration: 1.5, # hours
    release_date: (Time.now + 1.day),
)

film1.poster.attach(io: File.open('app/assets/images/film1.jpg'), filename: 'film1.jpg')


# test = Film.where(title: 'Promare').first
# test.delete if test

film2 = Film.create(
    title: 'Promare',
    synopsis: 'Thirty years has passed since the appearance of Burnish, a race of flame-wielding mutant beings, who destroyed half of the world with fire. When a new group of aggressive mutants appears, a battle begins.',
    rating: 8.5,
    language: 'Japanese',
    duration: 2, # hours
    release_date: (Time.now + 2.day),
)

film2.poster.attach(io: File.open('app/assets/images/film2.jpg'), filename: 'film2.jpg')


# test = Film.where(title: 'Your Name').first
# test.delete if test

film3 = Film.create(
    title: 'Your Name',
    synopsis: 'Two teenagers share a profound, magical connection upon discovering they are swapping bodies. But things become even more complicated when the boy and girl decide to meet in person.',
    rating: 9,
    language: 'Japanese',
    duration: 1.5, # hours
    release_date: (Time.now + 3.day),
)

film3.poster.attach(io: File.open('app/assets/images/film3.jpg'), filename: 'film3.jpg')

film4 = Film.create(
    title: 'Violet Evergarden: Eternity and the Auto Memory Doll poster',
    synopsis: "Violet Evergarden tutors a young lady at a private women's academy, but still grieves for the only person who ever brought her happiness.",
    rating: 6,
    language: 'Japanese',
    duration: 2, # hours
    release_date: (Time.now + 4.day),
)

film4.poster.attach(io: File.open('app/assets/images/violetevergarden.jpg'), filename: 'violetevergarden.jpg')

film5 = Film.create(
    title: 'Fireworks',
    synopsis: 'This film tells the story of a schoolgirl who finds a pretty transparent ball by the sea, on the day of a fireworks display of a religious festival in a seaside town in Japan. She plans to run away from home to escape from her unhappy home, as her mother is about to remarry for the third time.',
    rating: 8.7,
    language: 'Japanese',
    duration: 1.8, # hours
    release_date: (Time.now + 5.day),
)

film5.poster.attach(io: File.open('app/assets/images/fireworks.jpg'), filename: 'fireworks.jpg')

film6 = Film.create(
    title: 'A Silent Voice',
    synopsis: 'When a grade school student with impaired hearing is bullied mercilessly, she transfers to another school. Years later, one of her former tormentors sets out to make amends.',
    rating: 9,
    language: 'Japanese',
    duration: 1.5, # hours
    release_date: (Time.now + 6.day),
)

film6.poster.attach(io: File.open('app/assets/images/silentvoice.jpg'), filename: 'silentvoice.jpg')

film7 = Film.create(
    title: 'The Garden of Words',
    synopsis: 'When a lonely teenager skips his morning lessons to sit in a lovely garden, he meets a mysterious older woman who shares his feelings of alienation.',
    rating: 7.5,
    language: 'Japanese',
    duration: 1, # hours
    release_date: (Time.now + 7.day),
)

film7.poster.attach(io: File.open('app/assets/images/gardenofwords.jpg'), filename: 'gardenofwords.jpg')
# END

# Room Seeds
test = Room.where(id: 1).first
test.delete if test

room1 = Room.create(
    id: 1,
    numberOfSeats: 120,
    WheelChair_Access: true,
    format: 'A'
)

test = Room.where(id: 2).first
test.delete if test

room2 = Room.create(
    id: 2,
    numberOfSeats: 80,
    WheelChair_Access: false,
    format: 'B'
)

room3 = Room.create(
    id: 3,
    numberOfSeats: 70,
    WheelChair_Access: true,
    format: 'C'
)

# END

# Showings Seeds
test = Showing.where(id: 1).first
test.delete if test

showing1 = Showing.create(
    id: 1,
    startTime: Time.now + 4.day + 28.hours,
    finishTime: Time.now + 4.day + 28.hours + film1.duration.hours,
    film: film1,
    room: room1
)

test = Showing.where(id: 2).first
test.delete if test

showing2 = Showing.create(
    id: 2,
    startTime: Time.now + 4.day + 14.hours,
    finishTime: Time.now + 4.day + 14.hours + film1.duration.hours,
    film: film1,
    room: room2
)

test = Showing.where(id: 3).first
test.delete if test

showing3 = Showing.create(
    id: 3,
    startTime: Time.now + 4.day + 8.hours,
    finishTime: Time.now + 4.day + 8.hours + film1.duration.hours,
    film: film1,
    room: room1
)

test = Showing.where(id: 4).first
test.delete if test

showing4 = Showing.create(
    id: 4,
    startTime: Time.now + 4.day + 6.hours,
    finishTime: Time.now + 4.day + 6.hours + film1.duration.hours,
    film: film1,
    room: room1
)

test = Showing.where(id: 5).first
test.delete if test

showing5 = Showing.create(
    id: 5,
    startTime: Time.now + 4.day + 2.hours,
    finishTime: Time.now + 4.day + 2.hours + film2.duration.hours,
    film: film2,
    room: room2
)

test = Showing.where(id: 6).first
test.delete if test

showing6 = Showing.create(
    id: 6,
    startTime: Time.now + 1.day,
    finishTime: Time.now + 1.day + film2.duration.hours,
    film: film2,
    room: room2
)

test = Showing.where(id: 7).first
test.delete if test

showing7 = Showing.create(
    id: 7,
    startTime: Time.now + 2.day,
    finishTime: Time.now + 2.day + film2.duration.hours,
    film: film2,
    room: room2
)

test = Showing.where(id: 8).first
test.delete if test

showing8 = Showing.create(
    id: 8,
    startTime: Time.now + 3.day,
    finishTime: Time.now + 3.day + film3.duration.hours,
    film: film3,
    room: room3
)

test = Showing.where(id: 9).first
test.delete if test

showing9 = Showing.create(
    id: 9,
    startTime: Time.now + 4.day,
    finishTime: Time.now + 4.day + film3.duration.hours,
    film: film3,
    room: room3
)

test = Showing.where(id: 10).first
test.delete if test

showing10 = Showing.create(
    id: 10,
    startTime: Time.now + 2.day,
    finishTime: Time.now + 2.day + film3.duration.hours,
    film: film3,
    room: room2
)

test = Showing.where(id: 11).first
test.delete if test

showing11 = Showing.create(
    id: 11,
    startTime: Time.now + 3.day,
    finishTime: Time.now + 3.day + film3.duration.hours,
    film: film3,
    room: room3
)


test = Showing.where(id: 13).first
test.delete if test

showing13 = Showing.create(
    id: 13,
    startTime: Time.now + 6.day,
    finishTime: Time.now + 6.day + film5.duration.hours,
    film: film5,
    room: room2
)

test = Showing.where(id: 14).first
test.delete if test

showing14 = Showing.create(
    id: 14,
    startTime: Time.now + 5.day,
    finishTime: Time.now + 5.day + film6.duration.hours,
    film: film6,
    room: room3
)

test = Showing.where(id: 15).first
test.delete if test

showing15 = Showing.create(
    id: 15,
    startTime: Time.now + 2.day + 3.hours,
    finishTime: Time.now + 2.day + 3.hours + film7.duration.hours,
    film: film7,
    room: room1
)

test = Showing.where(id: 16).first
test.delete if test

showing16 = Showing.create(
    id: 16,
    startTime: Time.now + 6.day,
    finishTime: Time.now + 6.day + film7.duration.hours,
    film: film7,
    room: room3
)

test = Showing.where(id: 17).first
test.delete if test

showing17 = Showing.create(
    id: 17,
    startTime: Time.now + 2.day + 3.hours,
    finishTime: Time.now + 2.day + 3.hours + film1.duration.hours,
    film: film1,
    room: room1
)

test = Showing.where(id: 18).first
test.delete if test

showing18 = Showing.create(
    id: 18,
    startTime: Time.now + 6.day + 6.hours,
    finishTime: Time.now + 6.day + 6.hours + film1.duration.hours,
    film: film1,
    room: room3
)

test = Showing.where(id: 19).first
test.delete if test

showing19 = Showing.create(
    id: 19,
    startTime: Time.now + 6.day + 5.hours,
    finishTime: Time.now + 6.day + 5.hours + film1.duration.hours,
    film: film1,
    room: room2
)

# END

# Devise Seeds

admin = User.new
admin.forename = 'Harvey'
admin.surname = 'M-A'
admin.phonenumber = '077777777'
admin.email = 'admin@example.com'
admin.password = 'password' # this would never be done in real world
admin.password_confirmation = 'password' # this would never be done in real world
admin.admin = true
admin.save!

user = User.new
user.forename = 'Testuser'
user.surname = 'Smith'
user.phonenumber = '0777213123'
user.email = 'user@example.com'
user.password = 'password'
user.password_confirmation = 'password'
user.admin = false
user.save!

# END

# Booking Seeds

booking1 = Booking.create(
    showing: showing6,
    user: user,
)

booking2 = Booking.create(
    showing: showing4,
    user: admin,
)

booking3 = Booking.create(
    showing: showing2,
    user: admin,
)

booking4 = Booking.create(
    showing: showing1,
    user: admin,
)

booking5 = Booking.create(
    showing: showing8,
    user: admin,
)
# END

# Seats Seeds
#
#   CHANGE SEAT NUMBERS AND ROW/COL VALUES
#
seat = Seat.create(
    seatNumber: 48,
    booking: booking1,
    showing: booking1.showing,
    row: 4,
    col: 3,
)

seat2 = Seat.create(
    seatNumber: 105,
    booking: booking2,
    showing: booking2.showing,
    row: 6,
    col: 5,
)

seat3 = Seat.create(
    seatNumber: 105,
    booking: booking2,
    showing: booking2.showing,
    row: 6,
    col: 5,
)

seat4 = Seat.create(
    seatNumber: 105,
    booking: booking3,
    showing: booking3.showing,
    row: 6,
    col: 5,
)

seat5 = Seat.create(
    seatNumber: 105,
    booking: booking4,
    showing: booking4.showing,
    row: 6,
    col: 5,
)

seat6 = Seat.create(
    seatNumber: 105,
    booking: booking5,
    showing: booking5.showing,
    row: 6,
    col: 5,
)


# END