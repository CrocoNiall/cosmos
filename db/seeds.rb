# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u1 = User.create(name: '@CrocoNiall')
u2 = User.create(name: '@Jackie')

p1 = Place.create(name: 'London', lat: 51.5073509, long: -0.1277583, user_id: u1.id)
p2 = Place.create(name: 'Paris', long: 2.3522219, lat: 48.856614, user_id: u2.id)
p3 = Place.create(name: 'Hong Kong', long: 114.109497, lat: 22.396428,  user_id: u1.id)

# photo1 = Photo.create(url: 'www.google.com', place_id: p1.id, user_id: p1.user_id)
# photo2 = Photo.create(url: 'www.google.com', place_id: p1.id, user_id: p1.user_id)

# Vote.create(photo_id: photo1.id, vote: true)
# Vote.create(photo_id: photo2.id, vote: true)
# Vote.create(photo_id: photo1.id, vote: true)

