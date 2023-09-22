# This file should contain all the record creation needed to seed the database with its default values.

puts "Creating Properties...."
10.times do
  Property.create!(
    name: Faker::Lorem.word,
    headline: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    address_1: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: 'United States'
    # price_cents: (30..400).to_a.sample
  )
end
puts "Properties seeds created!!"
