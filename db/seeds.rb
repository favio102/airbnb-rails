# This file should contain all the record creation needed to seed the database with its default values.
require 'faker'

puts 'Cleaning data base...................'
Review.destroy_all
User.destroy_all
Reservation.destroy_all
Property.destroy_all
Profile.destroy_all
Favorite.destroy_all
puts 'Database cleaned!!'

puts 'Preparing data seeds..........'

puts 'Creating user images'
user_pictures = []
5.times do
  user_pictures << URI.parse(Faker::LoremFlickr.image).open
end
puts 'User images created!'

puts 'Creating users..........'
me = User.create(email: "test@pe.me", password: "wwweeerrr")
me.profile.update(first_name: "Jeremias", last_name: "Sprinfield")
me.profile.picture.attach(io: user_pictures[0], filename: "#{me.full_name}.jpg")

5.times do |i|
  user = User.create(email: Faker::Internet.email, password: "password")
  user.profile.update(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  user.profile.picture.attach(io: user_pictures[i + 1], filename: "#{user.full_name}.jpg")
end
puts 'Users data created!'

puts 'Creating Properties....'
11.times do |i|
  property = Property.create!(
    user: me,
    name: Faker::Lorem.unique.word,
    headline: Faker::Lorem.unique.sentence,
    description: Faker::Lorem.paragraphs(number: 30).join(' '),
    address_1: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country_code: 'US',
    price: Money.from_amount((25..100).to_a.sample)
  )
  puts 'Properties data created!!'
  property.images.attach(io: File.open(Rails.root.join('db', 'sample', 'images', "home_#{i + 1}.jpg")), filename: property.name)
  puts 'Creating reviews ....'
  (1..5).to_a.sample.times do
    Review.create(reviewable: property, rating: (1..5).to_a.sample, title: Faker::Lorem.word, body: Faker::Lorem.paragraph, user: User.all.sample)
  end
  puts 'Reviews created!!!'
end
puts 'Seed completed successfully'
