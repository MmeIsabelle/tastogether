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
users = {
  choco: User.create!(
    email: "user0@user.com",
    password: "123456",
    address: "632 Rue Cathcart, Montreal",
    username: "Marc",
    bio: "Extreme chocolate lover. Lifelong music expert. Incurable gamer. Social media nerd. Food fan. Explorer.",
    avatar: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/w_1000,c_fill,ar_1:1,g_auto,r_max,b_rgb:262c35/v1630190849/marc.jpg'
  ),
  sweet: User.create!(
    email: "user1@user.com",
    password: "123456",
    address: "8910 Rue Lajeunesse, Montreal",
    username: "Nick",
    bio: "Student. Sweets nerd. Icecream-a-holic. Introvert. Evil music aficionado. Freelance pop culture advocate. Coffee trailblazer.",
    avatar: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/w_1000,c_fill,ar_1:1,g_auto,r_max,b_rgb:262c35/v1630190866/nick.jpg'
  ),
  wine: User.create!(
    email: "user2@user.com",
    password: "123456",
    address: "1255 Square Phillips, Montreal",
    username: "Arlette",
    bio: "Wine specialist. Social media fan. Evil web geek. Introvert. Problem solver. Entrepreneur.",
    avatar: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/w_1000,c_fill,ar_1:1,g_auto,r_max,b_rgb:262c35/v1630190836/arlette.jpg'
  ),
  coffee: User.create!(
    email: "user3@user.com",
    password: "123456",
    address: "620 Saint-Catherine, Montreal",
    username: "Corrine",
    bio: "Coffee evangelist. Wannabe travel trailblazer. Twitter nerd. Alcohol advocate. Social media aficionado. Pop culture ninja.",
    avatar: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/w_1000,c_fill,ar_1:1,g_auto,r_max,b_rgb:262c35/v1630190856/corrine.jpg'
  ),
  bobby: User.create!(
    email: "user4@user.com",
    password: "123456",
    address: "192 Rue Saint-Zotique, Montreal",
    username: "Bobby",
    bio: "Food expert. Travel geek. Pop culture scholar. Troublemaker. Gamer. Coffee guru. Internet evangelist. Writer. Beer buff.",
    avatar: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/w_1000,c_fill,ar_1:1,g_auto,r_max,b_rgb:262c35/v1630190853/bobby.jpg'
  ),
  edgar: User.create!(
    email: "user5@user.com",
    password: "123456",
    address: "4534 Cartier, Montreal",
    username: "Fabiola",
    bio: "Beer trailblazer. Italy lover. Twitter buff. Travel specialist.",
    avatar: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/w_1000,c_fill,ar_1:1,g_auto,r_max,b_rgb:262c35/v1630190839/Fabiola.jpg'
  ),
  meg: User.create!(
    email: "meg@user.com",
    password: "123456",
    address: "888 Wellington, Montreal",
    username: "Meg",
    bio: "Food explorer. Web lover. Wine collector. Coffee enthusiast. Chocolate amateur.",
    avatar: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/w_1000,c_fill,ar_1:1,g_auto,r_max,b_rgb:262c35/v1630190929/meg-957fj3o9.jpg'
  )
}

#Creating tastings
tastings = {
  dark: Tasting.create!(
    title: "Dark chocolate party",
    description: "A variety of dark chocolate from different origins will be shared to explore the nuances and the different notes. Bring your favorite! The rarer the better.",
    location: "620 Rue Cathcart, Montreal",
    date: DateTime.new(2021, 9, 3, 20, 0, 0),
    capacity: 5,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/v1629996108/Tastogether/dark_chocolate_k402i4.jpg'
  ),
  coffee_tasting: Tasting.create!(
    title: "Exotic coffee tasting",
    description: "Bring your coffee of choice. Coffee connaisseurs only.",
    location: "620 Saint-Catherine, Montreal",
    start_at: DateTime.new(2021, 9, 6, 19, 0, 0),
    capacity: 4,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/a_90/v1629996106/Tastogether/coffee_lesk06.jpg'
  ),
  beans: Tasting.create!(
    title: "From the beans to the bar",
    description: "Chocolate made from scratch... Really! Let's taste chocolates made from beans from different countries. I will show you how I make it possible and we can discuss the subtle and not so subtle diffenrences in flavours.",
    location: "620 Rue Cathcart, Montreal",
    start_at: DateTime.new(2021, 9, 9, 19, 0, 0),
    capacity: 4,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/v1630000746/Tastogether/bean_to_bar_mzj7m2.jpg'
  ),
  gelato: Tasting.create!(
    title: "Gelato, just because...",
    description: "Gelato is just an amizing world to discover... Join in!",
    location: "8910 Rue Lajeunesse, Montreal",
    start_at: DateTime.new(2021, 9, 4, 15, 0, 0),
    capacity: 4,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/v1630000742/Tastogether/gelato_ela3ku.jpg'
  ),
  milk: Tasting.create!(
    title: "The milky way",
    description: "Because milk chocolates don't all taste the same! We will revisit some well know bars and compare them with some local chocolaters ",
    location: "620 Rue Cathcart, Montreal",
    start_at: DateTime.new(2021, 9, 7, 20, 0, 0),
    capacity: 4,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/v1630000740/Tastogether/chocolate_bar_em9caz.jpg'
  ),
  vintage: Tasting.create!(
    title: "From old to new",
    description: "Let's taste the same wine from different vintages to compare and discuss the effect of aging on the flavours.",
    location: "1255 Square Phillips, Montreal",
    start_at: DateTime.new(2021, 9, 16, 19, 30, 0),
    capacity: 6,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/v1629996979/Tastogether/wine_bgbbom.jpg'
  ),
  pizza: Tasting.create!(
    title: "Pizza party",
    description: "We will all order pizza from our favorite pizza restaurants to compare their take on the margarita pizza.",
    location: "4534 Cartier, Montreal",
    start_at: DateTime.new(2021, 9, 11, 20, 0, 0),
    capacity: 10,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/w_500,ar_16:9,c_fill,g_auto,e_sharpen/v1629996975/Tastogether/pizza_ixu3hd.jpg'
  ),
  barbeque: Tasting.create!(
    title: "Barbeque Bash",
    description: "We will barbeque up all kinds of meats.",
    location: "464 Rue McGill, Montreal",
    start_at: DateTime.new(2021, 8, 29, 20, 0, 0),
    capacity: 10,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/w_500,ar_16:9,c_fill,g_auto,e_sharpen/v1629996975/Tastogether/pizza_ixu3hd.jpg'
  )
}

#Creating hosts
Participation.create!(
  tasting: tastings[:dark],
  user: users[:choco],
  host: true,
  initial_message: Faker::Lorem.sentence,
  status: "accepted"
)

Participation.create!(
  tasting: tastings[:coffee_tasting],
  user: users[:coffee],
  host: true,
  initial_message: Faker::Lorem.sentence,
  status: "accepted"
)

Participation.create!(
  tasting: tastings[:beans],
  user: users[:choco],
  host: true,
  initial_message: Faker::Lorem.sentence,
  status: "accepted"
)

Participation.create!(
  tasting: tastings[:gelato],
  user: users[:sweet],
  host: true,
  initial_message: Faker::Lorem.sentence,
  status: "accepted"
)

Participation.create!(
  tasting: tastings[:milk],
  user: users[:choco],
  host: true,
  initial_message: Faker::Lorem.sentence,
  status: "accepted"
)

Participation.create!(
  tasting: tastings[:vintage],
  user: users[:wine],
  host: true,
  initial_message: Faker::Lorem.sentence,
  status: "accepted"
)

Participation.create!(
  tasting: tastings[:pizza],
  user: users[:edgar],
  host: true,
  initial_message: Faker::Lorem.sentence,
  status: "accepted"
)
Participation.create!(
  tasting: tastings[:barbeque],
  user: users[:edgar],
  host: true,
  initial_message: Faker::Lorem.sentence,
  status: "accepted"
)

# Creating participations
Participation.create!(
  tasting: tastings[:beans],
  user: users[:bobby],
  host: false,
  initial_message: Faker::Lorem.sentence,
  status: "accepted"
)

Participation.create!(
  tasting: tastings[:beans],
  user: users[:edgar],
  host: false,
  initial_message: Faker::Lorem.sentence,
  status: "pending"
)

Participation.create!(
  tasting: tastings[:vintage],
  user: users[:sweet],
  host: false,
  initial_message: Faker::Lorem.sentence,
  status: "pending"
)

Participation.create!(
  tasting: tastings[:vintage],
  user: users[:coffee],
  host: false,
  initial_message: Faker::Lorem.sentence,
  status: "accepted"
)

Participation.create!(
  tasting: tastings[:vintage],
  user: users[:bobby],
  host: false,
  initial_message: Faker::Lorem.sentence,
  status: "pending"
)

Participation.create!(
  tasting: tastings[:beans],
  user: users[:wine],
  host: false,
  initial_message: Faker::Lorem.sentence,
  status: "pending"
)

Participation.create!(
  tasting: tastings[:beans],
  user: users[:meg],
  host: false,
  initial_message: Faker::Lorem.sentence,
  status: "accepted"
)

Participation.create!(
  tasting: tastings[:milk],
  user: users[:sweet],
  host: false,
  initial_message: Faker::Lorem.sentence,
  status: "pending"
)

Participation.create!(
  tasting: tastings[:gelato],
  user: users[:wine],
  host: false,
  initial_message: Faker::Lorem.sentence,
  status: "pending"
)
Participation.create!(
  tasting: tastings[:barbeque],
  user: users[:meg],
  host: false,
  initial_message: Faker::Lorem.sentence,
  status: "pending"
)

puts "All done!"
