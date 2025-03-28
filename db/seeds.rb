require "faker"

User.destroy_all
Flat.destroy_all

puts "Cleaned my database."

user1 = User.create!(email: "jane@gmail.com", password: "fakersand")
user2 = User.create!(email: "fred@gmail.com", password: "fakersand")
user3 = User.create!(email: "sarah@gmail.com", password: "fakersand")

puts "Created my 3 users."

12.times do
  Flat.create!(name: Faker::Book.unique.title, description: Faker::Lorem.paragraph, address: Faker::Address.full_address, price_per_night: Faker::Number.within(range: 50..200), user: user1)
end

3.times do
  Flat.create!(name: Faker::Book.unique.title, description: Faker::Lorem.paragraph, address: Faker::Address.full_address, price_per_night: Faker::Number.within(range: 50..200), user: user2)
end

puts "Created my 15 flats."
