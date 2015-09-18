# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u1 = User.create(name: 'Niall')
u2 = User.create(name: 'Jack')

p1 = Place.create(name: 'london', long: 12.32, lat: 124.23, user_id: u1.id)
p2 = Place.create(name: 'Paris', long: 1342.32, lat: 12234.23, user_id: u2.id)
p3 = Place.create(name: 'Hong Kong', long: 12234.32, lat: 122344.23,  user_id: u1.id)

photo1 = Photo.create(url: 'photo 1 url', place_id: p1.id, user_id: p1.user_id)
photo2 = Photo.create(url: 'photo 2 url', place_id: p2.id, user_id: p1.user_id)

Vote.create(photo_id: photo1.id, vote: true)
Vote.create(photo_id: photo1.id, vote: false)
Vote.create(photo_id: photo1.id, vote: true)