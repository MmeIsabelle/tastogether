# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Destroy all
puts "Emptying database"
Participation.destroy_all
Tasting.destroy_all
User.destroy_all
puts "All participations, tastings, and users deleted!"

puts "Seeding database..."

puts "Creating users..."

User.create!(
  email: "user0@user.com",
  password: "123456",
  address: "632 Rue Cathcart, Montréal, QC H3B 1L9, Canada",
  username: Faker::Internet.username,
  bio: Faker::Lorem.paragraph_by_chars(number: 150),
  avatar: Faker::Avatar.image
)

User.create!(
  email: "user1@user.com",
  password: "123456",
  address: "8910 Rue Lajeunesse, Montréal, QC H2M 1R9, Canada",
  username: Faker::Internet.username,
  bio: Faker::Lorem.paragraph_by_chars(number: 150),
  avatar: Faker::Avatar.image
)

User.create!(
  email: "user2@user.com",
  password: "123456",
  address: "1255 Phillips Square Suite 800, Montreal, Quebec H3B 3G1, Canada",
  username: Faker::Internet.username,
  bio: Faker::Lorem.paragraph_by_chars(number: 150),
  avatar: Faker::Avatar.image
)

User.create!(
  email: "user3@user.com",
  password: "123456",
  address: "620 Saint-Catherine St W, Montreal, Quebec H3B 1B7, Canada",
  username: Faker::Internet.username,
  bio: Faker::Lorem.paragraph_by_chars(number: 150),
  avatar: Faker::Avatar.image
)

User.create!(
  email: "user4@user.com",
  password: "123456",
  address: "192 Rue Saint-Zotique E, Montréal, QC H2S 1K8, Canada",
  username: Faker::Internet.username,
  bio: Faker::Lorem.paragraph_by_chars(number: 150),
  avatar: Faker::Avatar.image
)
User.create!(
  email: "user5@user.com",
  password: "123456",
  address: "1478 Rue, Peel St, Montreal, Quebec H3A 1T1, Canada",
  username: Faker::Internet.username,
  bio: Faker::Lorem.paragraph_by_chars(number: 150),
  avatar: Faker::Avatar.image
)

puts "Created #{User.count} Users."

puts "Creating tastings and assigning users as hosts..."

Tasting.create!(
  title: "Dark chocolate party",
  description: "Bring your favorite type of dark chocolate. The rarer the better.",
  location: "620 Rue Cathcart #300, Montréal, QC H3B 1M1, Canada",
  date: Date.tomorrow,
  capacity: 5
)

Tasting.create!(
  title: "Exotic coffee tasting",
  description: "Bring your coffee of choice. Coffee connaisseurs only.",
  location: "1255 Boulevard Robert-Bourassa Suite #1505, Montreal, Quebec H3B 3V8, Canada",
  date: Date.tomorrow + 1,
  capacity: 8
)

Tasting.create!(
  title: "Pizza party",
  description: "We will all order pizza from our favorite pizza restaurants.",
  location: "5991 Victoria Ave, Montreal, Quebec H3W 2R9, Canada",
  date: Date.tomorrow + 10,
  capacity: 10
)

Tasting.all.each do |tasting|
  tasting.host_participation = User.all.sample
end

puts "You created #{Tasting.count} Tastings."
