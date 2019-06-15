# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do |n|
  name = Faker::Games::Pokemon.name + n.to_s
  email = Faker::Internet.email
  password = "password"
  face_image = "face_image"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               face_image: face_image,
               )
end
