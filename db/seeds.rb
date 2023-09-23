# This file should contain all the record creation needed to seed the database with its default values.
puts 'Preparing data seeds..........'
puts 'Creating Properties....'
11.times do |i|
  property = Property.create!(
    name: Faker::Lorem.unique.word,
    headline: Faker::Lorem.unique.sentence,
    description: Faker::Lorem.paragraphs(number: 30).join(' '),
    address_1: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: 'United States',
    price: Money.from_amount((25..100).to_a.sample)
  )
  puts 'Properties seeds created!!'
  puts 'Creating images.....'
  property.images.attach(io: File.open(Rails.root.join('db', 'sample', 'images', "home_#{i + 1}.jpg")), filename: property.name)
  puts 'Images created!'

  puts 'Creating reviews ....'
  (1..5).to_a.sample.times do
    Review.create(reviewable: property, rating: (1..5).to_a.sample, title: Faker::Lorem.word, body: Faker::Lorem.paragraph)
  end
  puts 'Reviews created!!!'
  puts 'Seed completed successfully'
end
