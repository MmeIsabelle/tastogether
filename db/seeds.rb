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

puts "Seeding database..."

User.create!(
  email: "user0@user.com",
  password: "123456",
  address: "632 Rue Cathcart, Montréal, QC H3B 1L9, Canada",
  username: Faker::Internet.username,
  bio: "Extreme beer lover. Lifelong music expert. Incurable gamer. Social media nerd. Zombie geek. Food fan. Explorer.",
  avatar: Faker::Avatar.image
)

User.create!(
  email: "user1@user.com",
  password: "123456",
  address: "8910 Rue Lajeunesse, Montréal, QC H2M 1R9, Canada",
  username: Faker::Internet.username,
  bio: "Student. Bacon nerd. Beeraholic. Introvert. Evil music aficionado. Freelance pop culture advocate. Coffee trailblazer.",
  avatar: Faker::Avatar.image
)

User.create!(
  email: "user2@user.com",
  password: "123456",
  address: "1255 Phillips Square Suite 800, Montreal, Quebec H3B 3G1, Canada",
  username: Faker::Internet.username,
  bio: "Devoted alcohol enthusiast. Zombie maven. Social media fan. Evil web geek. Introvert. Problem solver. Entrepreneur.",
  avatar: Faker::Avatar.image
)

User.create!(
  email: "user3@user.com",
  password: "123456",
  address: "620 Saint-Catherine St W, Montreal, Quebec H3B 1B7, Canada",
  username: Faker::Internet.username,
  bio: "Beer evangelist. Wannabe travel trailblazer. Twitter nerd. Alcohol advocate. Social media aficionado. Pop culture ninja.",
  avatar: Faker::Avatar.image
)

User.create!(
  email: "user4@user.com",
  password: "123456",
  address: "192 Rue Saint-Zotique E, Montréal, QC H2S 1K8, Canada",
  username: Faker::Internet.username,
  bio: "Food expert. Travel geek. Pop culture scholar. Troublemaker. Gamer. Coffee guru. Internet evangelist. Writer. Beer buff.",
  avatar: Faker::Avatar.image
)
User.create!(
  email: "user5@user.com",
  password: "123456",
  address: "1478 Rue, Peel St, Montreal, Quebec H3A 1T1, Canada",
  username: Faker::Internet.username,
  bio: "Beer trailblazer. Web lover. Twitter buff. Travel specialist. Avid alcohol maven.",
  avatar: Faker::Avatar.image
)

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

# Creating host participations
Tasting.all.each do |tasting|
  tasting.host = User.all.sample
end

# Creating other participations
5.times do
  # select a random user and select a random tasting
  rand_user = User.all.sample
  rand_tasting = Tasting.all.sample

  # create a new participation if
  ## 1. random user is not the host of the random tasting
  ## 2. OR random user is not already a participant of the tasting
  if rand_tasting.host != rand_user && rand_tasting.participations.where(user: rand_user).none?
    Participation.create!(
      tasting: rand_tasting,
      user: rand_user,
      host: false,
      initial_message: Faker::Lorem.sentence,
      status: "pending"
    )
  end
end

puts "All done!"
