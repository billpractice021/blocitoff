# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Item.destroy_all

5.times do
  User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

User.create(email: 'test@user.com', password: 'password')

users = User.all

50.times do
  Item.create(description: Faker::Lorem.sentence, user: users.sample)
end
