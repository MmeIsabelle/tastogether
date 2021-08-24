# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User seeds:

User.delete_all
puts "All Users deleted!"

User.create!(
  email: "host@user.com",
  password: "123456"
)

puts "You created #{User.count} Users."

# Tasting seeds:

Tasting.delete_all
puts "All Tastings deleted!"

Tasting.create!(
  title: "Dark chocolate party",
  description: "Bring your favorite type of dark chocolate. The rarer the better.",
  location: "555 fake avenue",
  date: Date.tomorrow,
  capacity: 5
)

Tasting.create!(
  title: "Exotic coffee tasting",
  description: "Bring your coffee of choice. Coffee connaisseurs only.",
  location: "888 test blvd",
  date: Date.tomorrow + 1,
  capacity: 8
)

Tasting.create!(
  title: "Pizza party",
  description: "We will all order pizza from our favorite pizza restaurants.",
  location: "1234 Nadav street",
  date: Date.tomorrow + 10,
  capacity: 10
)

puts "You created #{Tasting.count} Tastings."
