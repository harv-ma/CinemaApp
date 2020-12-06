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

film4 = Film.create(
    title: 'Violet Evergarden: Eternity and the Auto Memory Doll poster',
    synopsis: "Violet Evergarden tutors a young lady at a private women's academy, but still grieves for the only person who ever brought her happiness.",
    rating: 6,
    Language: 'Japanese',
    duration: 2, # hours
    Release_date: '2019-09-3',
)

film4.poster.attach(io: File.open('app/assets/images/violetevergarden.jpg'), filename: 'violetevergarden.jpg')

film5 = Film.create(
    title: 'Fireworks',
    synopsis: 'This film tells the story of a schoolgirl who finds a pretty transparent ball by the sea, on the day of a fireworks display of a religious festival in a seaside town in Japan. She plans to run away from home to escape from her unhappy home, as her mother is about to remarry for the third time.',
    rating: 8.7,
    Language: 'Japanese',
    duration: 1.8, # hours
    Release_date: '2017-09-18',
)

film5.poster.attach(io: File.open('app/assets/images/fireworks.jpg'), filename: 'fireworks.jpg')

film6 = Film.create(
    title: 'A Silent Voice',
    synopsis: 'When a grade school student with impaired hearing is bullied mercilessly, she transfers to another school. Years later, one of her former tormentors sets out to make amends.',
    rating: 9,
    Language: 'Japanese',
    duration: 1.5, # hours
    Release_date: '2017-03-15',
)

film6.poster.attach(io: File.open('app/assets/images/silentvoice.jpg'), filename: 'silentvoice.jpg')

film7 = Film.create(
    title: 'The Garden of Words',
    synopsis: 'When a lonely teenager skips his morning lessons to sit in a lovely garden, he meets a mysterious older woman who shares his feelings of alienation.',
    rating: 7.5,
    Language: 'Japanese',
    duration: 1, # hours
    Release_date: '2013-04-28',
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
    format: 'A'
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

# Devise Seeds

admin = User.new
admin.forename = 'Harvey'
admin.surname = 'M-A'
admin.phonenumber = '077777777'
admin.email = 'hm00929@surrey.ac.uk'
admin.password = 'password'
admin.password_confirmation = 'password'
admin.admin = true
admin.save!

user = User.new
user.forename = 'Testuser'
user.surname = 'Smith'
user.phonenumber = '0777213123'
user.email = 'example@example.com'
user.password = 'password'
user.password_confirmation = 'password'
user.admin = false
user.save!

# u = User.create(
#     id: 1,
#     forename: 'Harvey',
#     surname: 'M-A',
#     phonenumber: '07777777777',
#     email: 'hm00929@surrey.ac.uk',
#     encrypted_password:'$2a$12$ADEQfg58i8fOngzF/pmbK.fmm/GW3xwxVIvIYLznbwtXDTxkSSUW2',
# )

# END

# Booking Seeds

booking1 = Booking.create(
    showing: showing,
    user: user,
)



# END

# Seats Seeds
seat = Seat.create(
    booking: booking1,
    showing: showing,
    row: 4,
    col: 3,
    disablity_access: false
)


# END