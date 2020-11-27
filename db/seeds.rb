# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# test = Customer.where(phonenumber: '12345678').first
# test.delete if test

# customers = Customer.create([
#     forename: 'Harvey',
#     surname: 'M-A',
#     phonenumber: '12345678',
#     email: 'hm00929@surrey.ac.uk',
#     password: 'test'
# ])



test = Film.where(title: 'Weathering With You').first
test.delete if test



film1 = Film.create(
    title: 'Weathering With You',
    synopsis: 'A boy runs away to Tokyo and befriends a girl who appears to be able to manipulate the weather.',
    rating: 10,
    Language: 'Japanese',
    Release_date: '2020-11-06',
)

film1.poster.attach(io: File.open('app/assets/images/film1.jpg'), filename: 'film1.jpg')


test = Film.where(title: 'Promare').first
test.delete if test

film2 = Film.create(
    title: 'Promare',
    synopsis: 'Thirty years has passed since the appearance of Burnish, a race of flame-wielding mutant beings, who destroyed half of the world with fire. When a new group of aggressive mutants appears, a battle begins.',
    rating: 8.5,
    Language: 'Japanese',
    Release_date: '2020-11-06',
)

film2.poster.attach(io: File.open('app/assets/images/film2.jpg'), filename: 'film2.jpg')
