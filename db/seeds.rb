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

#Creating tastings and hosts
Tasting.create!(
  title: "Dark chocolate party",
  description: "A variety of dark chocolate from different origins will be shared to explore the nuances and the different notes. Bring your favorite! The rarer the better.",
  location: "620 Rue Cathcart #300, Montréal, QC H3B 1M1, Canada",
  date: Date.tomorrow,
  capacity: 5,
  image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/v1629996108/Tastogether/dark_chocolate_k402i4.jpg'
)
Participation.create!(
  tasting: Tasting.find_by(title: "Dark chocolate party"),
  user: User.find_by(email: "user4@user.com"),
  host: true,
  initial_message: Faker::Lorem.sentence,
  status: "accepted"
)

#Creating tastings
tastings = {
  coffee_tasting: Tasting.create!(
    title: "Exotic coffee tasting",
    description: "Bring your coffee of choice. Coffee connaisseurs only.",
    location: "1255 Boulevard Robert-Bourassa Suite #1505, Montreal, Quebec H3B 3V8, Canada",
    date: Date.tomorrow + 1,
    capacity: 4,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/a_90/v1629996106/Tastogether/coffee_lesk06.jpg'
  ),
  beans: Tasting.create!(
    title: "From the beans to the bar",
    description: "Chocolate made from scratch... Really! Let's taste chocolates made from beans from different countries. I will show you how I make it possible and we can discuss the subtle and not so subtle diffenrences in flavours.",
    location: "1290 Av. Bernard, Outremont, QC H2V 1V9, Canada",
    date: Date.tomorrow + 3,
    capacity: 4,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/v1630000746/Tastogether/bean_to_bar_mzj7m2.jpg'
  ),
  gelato: Tasting.create!(
    title: "Gelato, just because...",
    description: "Gelato is just an amizing world to discover... Join in!",
    location: "1290 Av. Bernard, Outremont, QC H2V 1V9, Canada",
    date: Date.tomorrow + 6,
    capacity: 4,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/v1630000742/Tastogether/gelato_ela3ku.jpg'
  ),
  milk: Tasting.create!(
    title: "The milky way",
    description: "Because milk chocolates don't all taste the same! We will revisit some well know bars and compare them with some local chocolaters ",
    location: "2221 Rue Workman, Montréal, QC H3J 2N6, Canada",
    date: Date.tomorrow + 5,
    capacity: 4,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/v1630000740/Tastogether/chocolate_bar_em9caz.jpg'
  ),
  vintage: Tasting.create!(
    title: "From old to new",
    description: "Let's taste the same wine from different vintages to compare and discuss the effect of aging on the flavours.",
    location: "852 Rue Sherbrooke, Montreal, Quebec H2L 1K9, Canada",
    date: Date.tomorrow + 10,
    capacity: 6,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/v1629996979/Tastogether/wine_bgbbom.jpg'
  ),
  pizza: Tasting.create!(
    title: "Pizza party",
    description: "We will all order pizza from our favorite pizza restaurants to compare their take on the margarita pizza.",
    location: "5991 Victoria Ave, Montreal, Quebec H3W 2R9, Canada",
    date: Date.tomorrow + 10,
    capacity: 10,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/w_1000,ar_16:9,c_fill,g_auto,e_sharpen/v1629996975/Tastogether/pizza_ixu3hd.jpg'
  )
}

#Creating hosts
Participation.create!(
  tasting: tastings[:coffee_tasting],
  user: User.find_by(email: "user0@user.com"),
  host: true,
  initial_message: Faker::Lorem.sentence,
  status: "accepted"
)

Participation.create!(
  tasting: tastings[:beans],
  user: User.find_by(email: "user0@user.com"),
  host: true,
  initial_message: Faker::Lorem.sentence,
  status: "accepted"
)

Participation.create!(
  tasting: tastings[:gelato],
  user: User.find_by(email: "user0@user.com"),
  host: true,
  initial_message: Faker::Lorem.sentence,
  status: "accepted"
)

Participation.create!(
  tasting: tastings[:milk],
  user: User.find_by(email: "user4@user.com"),
  host: true,
  initial_message: Faker::Lorem.sentence,
  status: "accepted"
)

Participation.create!(
  tasting: tastings[:vintage],
  user: User.find_by(email: "user0@user.com"),
  host: true,
  initial_message: Faker::Lorem.sentence,
  status: "accepted"
)

Participation.create!(
  tasting: tastings[:pizza],
  user: User.find_by(email: "user3@user.com"),
  host: true,
  initial_message: Faker::Lorem.sentence,
  status: "accepted"
)

# Creating participations
Participation.create!(
  tasting: tastings[:beans],
  user: User.find_by(email: "user1@user.com"),
  host: false,
  initial_message: Faker::Lorem.sentence,
  status: "pending"
)

Participation.create!(
  tasting: tastings[:beans],
  user: User.find_by(email: "user4@user.com"),
  host: false,
  initial_message: Faker::Lorem.sentence,
  status: "pending"
)

Participation.create!(
  tasting: tastings[:vintage],
  user: User.find_by(email: "user1@user.com"),
  host: false,
  initial_message: Faker::Lorem.sentence,
  status: "pending"
)

Participation.create!(
  tasting: tastings[:vintage],
  user: User.find_by(email: "user4@user.com"),
  host: false,
  initial_message: Faker::Lorem.sentence,
  status: "accepted"
)

Participation.create!(
  tasting: tastings[:vintage],
  user: User.find_by(email: "user5@user.com"),
  host: false,
  initial_message: Faker::Lorem.sentence,
  status: "pending"
)

Participation.create!(
  tasting: tastings[:beans],
  user: User.find_by(email: "user1@user.com"),
  host: false,
  initial_message: Faker::Lorem.sentence,
  status: "pending"
)

Participation.create!(
  tasting: tastings[:milk],
  user: User.find_by(email: "user3@user.com"),
  host: false,
  initial_message: Faker::Lorem.sentence,
  status: "pending"
)

Participation.create!(
  tasting: tastings[:gelato],
  user: User.find_by(email: "user2@user.com"),
  host: false,
  initial_message: Faker::Lorem.sentence,
  status: "pending"
)

puts "All done!"
