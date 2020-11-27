# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# test = Customer.where(phonenumber: '12345678').first
# test.delete if test

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
    Language: 'Japanese',
    duration: 1.5, # hours
    Release_date: '2020-11-06',
)

film1.poster.attach(io: File.open('app/assets/images/film1.jpg'), filename: 'film1.jpg')


# test = Film.where(title: 'Promare').first
# test.delete if test

film2 = Film.create(
    title: 'Promare',
    synopsis: 'Thirty years has passed since the appearance of Burnish, a race of flame-wielding mutant beings, who destroyed half of the world with fire. When a new group of aggressive mutants appears, a battle begins.',
    rating: 8.5,
    Language: 'Japanese',
    duration: 2, # hours
    Release_date: '2020-11-06',
)

film2.poster.attach(io: File.open('app/assets/images/film2.jpg'), filename: 'film2.jpg')


# test = Film.where(title: 'Your Name').first
# test.delete if test

film3 = Film.create(
    title: 'Your Name',
    synopsis: 'Two teenagers share a profound, magical connection upon discovering they are swapping bodies. But things become even more complicated when the boy and girl decide to meet in person.',
    rating: 9,
    Language: 'Japanese',
    duration: 1.5, # hours
    Release_date: '2016-10-18',
)

film3.poster.attach(io: File.open('app/assets/images/film3.jpg'), filename: 'film3.jpg')


# END

# Room Seeds
test = Room.where(id: 1).first
test.delete if test

room1 = Room.create(
    id: 1,
    numberOfSeats: 120,
    WheelChair_Access: true
)

test = Room.where(id: 2).first
test.delete if test

room2 = Room.create(
    id: 2,
    numberOfSeats: 80,
    WheelChair_Access: false
)

# END

# Showings Seeds
test = Showing.where(id: 1).first
test.delete if test

showing = Showing.create(
    id: 1,
    startTime: '2020-02-01 22:30:00',
    film: film1,
    room: room1
)

test = Showing.where(id: 2).first
test.delete if test

showing = Showing.create(
    id: 2,
    startTime: '2020-01-21 12:25:00',
    film: film2,
    room: room1
)

# END