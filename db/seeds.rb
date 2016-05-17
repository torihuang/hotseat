# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

3.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 'password')
end

15.times do
  Game.create(creator: User.all.to_a.sample, title: ['Bachelorette Party', 'Family Game Night', 'Bridal Shower', 'Bachelor Party', 'Birthday Party', 'Graduation'].sample, victim: Faker::Name, answerer_name: Faker::Name, answerer_email: Faker::Internet.email)
end

150.times do
  Question.create(game: Game.all.to_a.sample, query: Faker::Lorem.words(20).join(' ') + "?")
end