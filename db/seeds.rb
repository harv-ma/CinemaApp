# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

test = Customer.where(phonenumber: '12345678').first
test.delete if test

customers = Customer.create([
    forename: 'Harvey',
    surname: 'M-A',
    phonenumber: '12345678',
    email: 'hm00929@surrey.ac.uk',
    password: ''
])

test = Customer.where(phonenumber: '12345678').first
test.delete if test

rooms = Room.create([
    forename: 'Harvey',
    surname: 'M-A',
    phonenumber: '12345678'
])
