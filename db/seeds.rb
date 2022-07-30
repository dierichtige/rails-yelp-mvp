# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."

# creating 5 restaurants
5.times do
  restaurant = Restaurant.new(name: Faker::Restaurant.name, address: Faker::Address.full_address, phone_number: Faker::PhoneNumber.phone_number_with_country_code, category: ["chinese", "italian", "japanese", "french", "belgian"].sample)
  restaurant.save
  puts "Created #{restaurant.id} - #{restaurant.name}"
  # creating 3 reviews for each restaurant
  3.times do
    review = Review.new(content: Faker::Restaurant.review, rating: rand(0..5))
    review.restaurant = restaurant
    review.save
    puts "Created Review #{review.id} for #{restaurant.name}"
  end
end

puts "Finished!"
