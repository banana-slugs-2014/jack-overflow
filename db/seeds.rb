# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

2.times do
  User.create({username: Faker::Name.first_name, password: "admin"}, without_protection: true)
end

5.times do
  Question.create({title: Faker::Lorem.word, body: Faker::Lorem.sentence(3), user_id: (1...2).to_a.sample}, without_protection: true)
end

10.times do
  Answer.create({ body: Faker::Lorem.sentence(3), question_id: (1...5).to_a.sample, user_id: (1...2).to_a.sample}, without_protection: true)
end

10.times do
  Comment.create({body: Faker::Lorem.sentence, user_id: (1...2).to_a.sample, post_id: (1...15).to_a.sample}, without_protection: true)
end

10.times do
  Vote.create({value: (-1...1).to_a.sample, user_id: (1...2).to_a.sample, post_id: (1...15).to_a.sample}, without_protection: true)
  end