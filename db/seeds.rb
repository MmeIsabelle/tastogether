# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Destroy all
puts "Emptying database"
Categorization.destroy_all
Category.destroy_all
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
    bio: "Extreme chocolate lover. Lifelong music expert. Food fan. Explorer.",
    avatar: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/w_500,c_thumb,g_face,z_0.9,ar_1:1,g_auto,r_max,b_rgb:262c35/v1630190849/marc.jpg'
  ),
  sweet: User.create!(
    email: "user1@user.com",
    password: "123456",
    address: "8910 Rue Lajeunesse, Montreal",
    username: "Nick",
    bio: "I have a huge sweet tooth. Nothing better than a good barbeque with some friends.",
    avatar: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/w_500,c_thumb,g_face,ar_1:1,g_auto,r_max,b_rgb:262c35/v1630190866/nick.jpg'
  ),
  wine: User.create!(
    email: "user2@user.com",
    password: "123456",
    address: "1255 Square Phillips, Montreal",
    username: "Arlette",
    bio: "Entrepreneur. A bottle of wine is the best way to unwind after a long day. Tea > Coffee",
    avatar: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/w_500,c_thumb,g_face,z_1.1,ar_1:1,g_auto,r_max,b_rgb:262c35/v1630190836/arlette.jpg'
  ),
  coffee: User.create!(
    email: "user3@user.com",
    password: "123456",
    address: "620 Saint-Catherine, Montreal",
    username: "Corrine",
    bio: "Coffee evangelist and chocolate fanatic. Architect by trade.",
    avatar: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/w_500,c_thumb,g_face,z_0.9,ar_1:1,g_auto,r_max,b_rgb:262c35/v1630190856/corrine.jpg'
  ),
  bobby: User.create!(
    email: "user4@user.com",
    password: "123456",
    address: "192 Rue Saint-Zotique, Montreal",
    username: "Bobby",
    bio: "Finance professional that loves to travel and experience new food",
    avatar: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/w_500,c_thumb,g_face,z_0.9,ar_1:1,g_auto,r_max,b_rgb:262c35/v1630190853/bobby.jpg'
  ),
  fabiola: User.create!(
    email: "user5@user.com",
    password: "123456",
    address: "4534 Cartier, Montreal",
    username: "Fabiola",
    bio: "Beer trailblazer and Italy lover. Willing to spice it up when it comes to my food",
    avatar: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/w_500,c_thumb,g_face,z_1.1,ar_1:1,g_auto,r_max,b_rgb:262c35/v1630190839/Fabiola.jpg'
  ),
  meg: User.create!(
    email: "meg@user.com",
    password: "123456",
    address: "888 Wellington, Montreal",
    username: "Meg",
    bio: "Food explorer. Web lover. Wine collector. Coffee enthusiast. Chocolate amateur.",
    avatar: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/w_500,c_fill,g_face,z_1.2,ar_1:1,g_auto,r_max,b_rgb:262c35/v1630190929/meg-957fj3o9.jpg'
  ),
  lorenzo: User.create!(
    email: "user6@user.com",
    password: "123456",
    address: "731 William Street, Montréal",
    username: "Lorenzo22",
    bio: "Italian born foodie living in Montreal. I love pasta, gelato and coffee.",
    avatar: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/w_500,c_thumb,g_face,z_0.8,ar_1:1,g_auto,r_max,b_rgb:262c35/v1630190845/lorenzo22.jpg'
  ),
  max: User.create!(
    email: "user7@user.com",
    password: "123456",
    address: "1208 Crescent Street, Montréal",
    username: "MaxLo",
    bio: "Montreal born. Food is my passion. Sour and salty is the perfect combination.",
    avatar: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/w_500,c_thumb,g_face,z_0.9,ar_1:1,g_auto,r_max,b_rgb:262c35/v1630541486/max.jpg'
  ),
  charlie: User.create!(
    email: "user8@user.com",
    password: "123456",
    address: "1196 rue Peel, Montréal",
    username: "CJ85",
    bio: "Professional Violinist and Amateur Foodie.",
    avatar: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/w_500,c_thumb,g_face,z_0.9,ar_1:1,g_auto,r_max,b_rgb:262c35/v1630541484/charlie.jpg'
  ),
  rachel: User.create!(
    email: "user9@user.com",
    password: "123456",
    address: "1446 Rue Crescent, Montréal",
    username: "RachelG",
    bio: "Elementary school teacher by day and foodie by night.",
    avatar: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/w_500,c_thumb,g_face,z_0.9,ar_1:1,g_auto,r_max,b_rgb:262c35/v1630190870/rachel.jpg'
  ),
  jules: User.create!(
    email: "user10@user.com",
    password: "123456",
    address: "1446 Rue Crescent, Montréal",
    username: "JulesT",
    bio: "I love to travel because I love to discover foreign food. Looking to meetup with people who share similar preferences as me when it comes to food.",
    avatar: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/w_500,c_thumb,g_face,z_1.1,ar_1:1,g_auto,r_max,b_rgb:262c35/v1630542108/jules.jpg'
  )
}

#Creating tastings
tastings = {
  dark: Tasting.create!(
    title: "Dark chocolate party",
    description: "A variety of dark chocolate from different origins will be shared to explore the nuances and the different notes. Bring your favorite! The rarer the better.",
    location: "632 Rue Cathcart, Montreal",
    date: DateTime.new(2021, 9, 3, 20, 0, 0),
    capacity: 5,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/v1629996108/Tastogether/dark_chocolate_k402i4.jpg'
  ),
  coffee_tasting: Tasting.create!(
    title: "Exotic coffee tasting",
    description: "Bring your coffee of choice. We will talk about our favourites. 4 spots available. Coffee connaisseurs only. Must be older than 25.",
    location: "620 Saint-Catherine, Montreal",
    start_at: DateTime.new(2021, 9, 6, 19, 0, 0),
    capacity: 4,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/a_90/v1629996106/Tastogether/coffee_lesk06.jpg'
  ),
  beans: Tasting.create!(
    title: "From the beans to the bar",
    description: "Chocolate made from scratch... Really! Let's taste chocolates made from beans from different countries. I will show you how I make it possible and we can discuss the subtle and not so subtle diffenrences in flavours.",
    location: "620 Saint-Catherine, Montreal",
    start_at: DateTime.new(2021, 9, 9, 19, 0, 0),
    capacity: 4,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/v1630000746/Tastogether/bean_to_bar_mzj7m2.jpg'
  ),
  gelato: Tasting.create!(
    title: "Gelato, just because...",
    description: "There is nothing better than a good gelato. For those that have tried it to those who have not, this event is one you don't want to miss. Gelato is just an amazing world to discover... Let's do it together! I will be buying many types of gelato fo us to savour.",
    location: "731 William Street, Montréal",
    start_at: DateTime.new(2021, 9, 4, 15, 0, 0),
    capacity: 8,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/v1630000742/Tastogether/gelato_ela3ku.jpg'
  ),
  milk: Tasting.create!(
    title: "The milky way",
    description: "Because milk chocolates don't all taste the same! We will revisit some well know bars and compare them with some local chocolaters ",
    location: "632 Rue Cathcart, Montreal",
    start_at: DateTime.new(2021, 9, 7, 20, 0, 0),
    capacity: 4,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/v1630000740/Tastogether/chocolate_bar_em9caz.jpg'
  ),
  vintage: Tasting.create!(
    title: "From old to new",
    description: "Let's taste the same wine from different vintages to compare and discuss the effect of aging on the flavours. 6 spots available. Wine experts and amateurs allowed. ",
    location: "1255 Square Phillips, Montreal",
    start_at: DateTime.new(2021, 9, 16, 19, 30, 0),
    capacity: 6,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/v1629996979/Tastogether/wine_bgbbom.jpg'
  ),
  pizza: Tasting.create!(
    title: "Margarita Pizza Contest",
    description: "We will all order pizza from our favorite pizza restaurants to compare their take on the margarita pizza. 10 spots available. Looking forward to it!",
    location: "4534 Cartier, Montreal",
    start_at: DateTime.new(2021, 9, 11, 20, 0, 0),
    capacity: 10,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/w_500,ar_16:9,c_fill,g_auto,e_sharpen/v1629996975/Tastogether/pizza_ixu3hd.jpg'
  ),
  barbeque: Tasting.create!(
    title: "Barbeque Bash",
    description: "We will barbeque up all kinds of meats. Steaks, hot dogs, hamburgers, you name it. Afterwords we will hang out with a few beers in my backyard. Hoping to see you there!",
    location: "192 Rue Saint-Zotique, Montreal",
    start_at: DateTime.new(2021, 9, 29, 20, 0, 0),
    capacity: 10,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/v1630543291/bbq.jpg'
  ),
  banh_mi: Tasting.create!(
    title: "Banh Mi: Best Sandwich",
    description: "In my opinion a banh mi is the best kind of sandwich in the world. Duh. All who share my opinon are welcome to come over and bring their own banh mi sandwich favorites for others to delight in. I will personally have several different varieties of banh mi sandwiches for us to eat. It's gonna be a great time!",
    location: "1446 Rue Crescent, Montréal",
    start_at: DateTime.new(2021, 9, 9, 12, 30, 0),
    capacity: 7,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/v1630543287/banhmi.jpg'
  ),
  tea: Tasting.create!(
    title: "Tea and Biscuits Time",
    description: "Growing up in England I loved chatting and catching up with my friends while drinking tea. It is one of the things I miss the most about the U.K. now that I live in North America. So, I am looking for at most 4 other people to come over and chat over a nice cup of tea. I have a large selection for us to sample.",
    location: "1255 Square Phillips, Montreal",
    start_at: DateTime.new(2021, 9, 8, 2, 30, 0),
    capacity: 4,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/v1630543295/tea.jpg'
  ),
  beer: Tasting.create!(
    title: "Indian Pale Ale Meetup",
    description: "I am a huge fan of IPA's and recently I have found that there are so many more under the radar brands. Whether you are a fan of bitter or sweet IPA's, bring your favourite IPA and we will do a sampling of all the IPA's that everyone brings and debate which is the best! Please register quickly as I expect the available spots to be taken quickly. Food will be provided. ",
    location: "4534 Cartier, Montreal",
    start_at: DateTime.new(2021, 10, 3, 4, 30, 0),
    capacity: 6,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/v1630543687/beers.jpg'
  ),
  spice: Tasting.create!(
    title: "Spice is Life",
    description: "Are you a fan of the show Hot Ones? I am hosting a hot sauce challenge where each of us will eat 10 hot sauces on chicken wings that I will barbeque. Each round the hot sauce will hit harder and harder and any who are left standing will be crowned champions and will most likely burn all their taste buds. I am hoping for a huge turnout, so if you like spicey food and pushing yourself to the limit, then be there.",
    location: "192 Rue Saint-Zotique, Montreal",
    start_at: DateTime.new(2021, 9, 27, 6, 20, 0),
    capacity: 10,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/v1630543299/hotsauce.jpg'
  ),
  italian: Tasting.create!(
    title: "Italian Food Lovers",
    description: "Calling all Italian food lovers. Me and my friends cannot get enough of Italian food and are looking to try out and experiment with new recipes. We are hosting an event where attendees can bring their favourite Italian recipes and we can all sample them and get each other's recipes! There will be 8 spots available. I will provide white wine for all of us as well.",
    location: "731 William Street, Montréal",
    start_at: DateTime.new(2021, 9, 16, 6, 0, 0),
    capacity: 8,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/v1630543301/italian.jpg'
  ),
  fried: Tasting.create!(
    title: "Fried Food Fest",
    description: "Hey everyone! Who doesn't love fried food? Whether it's for a meal like fried chicken or for desert like fried ice cream, fried food is just awesome. I welcome all fried food lovers to come and enjoy all the fried food they can ever eat. No need to bring anything. Everything will be provided. See you there.",
    location: "8910 Rue Lajeunesse, Montreal",
    start_at: DateTime.new(2021, 9, 22, 7, 0, 0),
    capacity: 5,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/v1630543304/fried.jpg'
  ),
  taco: Tasting.create!(
    title: "Taco Takeover",
    description: "For all you taco people out there, this event is for you. Me and my wife love making all different kinds of authentic tacos and sharing them with others. So, bring a bottle of wine and let's meet up over some Tacos in my backyard. As of now we have 4 spots available. Note that me and my wife are in our late thirties, so we would prefer if attendees are around that age.",
    location: "192 Rue Saint-Zotique, Montreal",
    start_at: DateTime.new(2021, 9, 18, 7, 30, 0),
    capacity: 4,
    image: 'https://res.cloudinary.com/dd3n6uf2t/image/upload/v1630543280/tacos.jpg'
  )
}

participations = {
  #Creating hosts
  host: {
    host_dark: Participation.create!(
      tasting: tastings[:dark],
      user: users[:choco],
      host: true,
      initial_message: Faker::Lorem.sentence,
      status: "accepted"
    ),
    host_coffee: Participation.create!(
      tasting: tastings[:coffee_tasting],
      user: users[:coffee],
      host: true,
      initial_message: Faker::Lorem.sentence,
      status: "accepted"
    ),
    host_beans: Participation.create!(
      tasting: tastings[:beans],
      user: users[:coffee],
      host: true,
      initial_message: Faker::Lorem.sentence,
      status: "accepted"
    ),
    host_gelato: Participation.create!(
      tasting: tastings[:gelato],
      user: users[:lorenzo],
      host: true,
      initial_message: Faker::Lorem.sentence,
      status: "accepted"
    ),
    host_milk: Participation.create!(
      tasting: tastings[:milk],
      user: users[:choco],
      host: true,
      initial_message: Faker::Lorem.sentence,
      status: "accepted"
    ),
    host_vintage: Participation.create!(
      tasting: tastings[:vintage],
      user: users[:wine],
      host: true,
      initial_message: Faker::Lorem.sentence,
      status: "accepted"
    ),
    host_pizza: Participation.create!(
      tasting: tastings[:pizza],
      user: users[:fabiola],
      host: true,
      initial_message: Faker::Lorem.sentence,
      status: "accepted"
    ),
    host_barbeque: Participation.create!(
      tasting: tastings[:barbeque],
      user: users[:bobby],
      host: true,
      initial_message: Faker::Lorem.sentence,
      status: "accepted"
    ),
    host_banh: Participation.create!(
      tasting: tastings[:banh_mi],
      user: users[:rachel],
      host: true,
      initial_message: Faker::Lorem.sentence,
      status: "accepted"
    ),
    host_tea: Participation.create!(
      tasting: tastings[:tea],
      user: users[:wine],
      host: true,
      initial_message: Faker::Lorem.sentence,
      status: "accepted"
    ),
    host_beer: Participation.create!(
      tasting: tastings[:beer],
      user: users[:fabiola],
      host: true,
      initial_message: Faker::Lorem.sentence,
      status: "accepted"
    ),
    host_spice: Participation.create!(
      tasting: tastings[:spice],
      user: users[:bobby],
      host: true,
      initial_message: Faker::Lorem.sentence,
      status: "accepted"
    ),
    host_italian: Participation.create!(
      tasting: tastings[:italian],
      user: users[:lorenzo],
      host: true,
      initial_message: Faker::Lorem.sentence,
      status: "accepted"
    ),
    host_fried: Participation.create!(
      tasting: tastings[:fried],
      user: users[:sweet],
      host: true,
      initial_message: Faker::Lorem.sentence,
      status: "accepted"
    ),
    host_taco: Participation.create!(
      tasting: tastings[:taco],
      user: users[:bobby],
      host: true,
      initial_message: Faker::Lorem.sentence,
      status: "accepted"
    )
  },
  # Creating participations
  not_hosted: {
    beans: [
      Participation.create!(
        tasting: tastings[:beans],
        user: users[:choco],
        host: false,
        initial_message: Faker::Lorem.sentence,
        status: "accepted"
      ),
      Participation.create!(
        tasting: tastings[:beans],
        user: users[:fabiola],
        host: false,
        initial_message: "Hey! I have recently really gotten into eating different kinds of chocolate and your event sounds super interesting. Do you have room for one more?",
        status: "pending"
      ),
        Participation.create!(
          tasting: tastings[:beans],
          user: users[:wine],
          host: false,
          initial_message: "Hi. I found your event and I am really excited about the prospect of experiencing chocolate in this way. I would love to attend.",
          status: "pending"
      )],
    vintage: [
      Participation.create!(
        tasting: tastings[:vintage],
        user: users[:sweet],
        host: false,
        initial_message: Faker::Lorem.sentence,
        status: "pending"
      ),
      Participation.create!(
        tasting: tastings[:vintage],
        user: users[:coffee],
        host: false,
        initial_message: Faker::Lorem.sentence,
        status: "accepted"
      ),
      Participation.create!(
        tasting: tastings[:vintage],
        user: users[:bobby],
        host: false,
        initial_message: Faker::Lorem.sentence,
        status: "pending"
      )],
    milk: [
      Participation.create!(
        tasting: tastings[:milk],
        user: users[:sweet],
        host: false,
        initial_message: "Hey! Your event sounds amazing. As a fellow chocolate lover, going to this event would make my day",
        status: "pending"
      )],
    gelato: [
      Participation.create!(
        tasting: tastings[:gelato],
        user: users[:wine],
        host: false,
        initial_message: Faker::Lorem.sentence,
        status: "accepted"
      ),
      Participation.create!(
        tasting: tastings[:gelato],
        user: users[:coffee],
        host: false,
        initial_message: Faker::Lorem.sentence,
        status: "accepted"
      ),
      Participation.create!(
        tasting: tastings[:gelato],
        user: users[:sweet],
        host: false,
        initial_message: Faker::Lorem.sentence,
        status: "accepted"
      ),
      Participation.create!(
        tasting: tastings[:gelato],
        user: users[:bobby],
        host: false,
        initial_message: Faker::Lorem.sentence,
        status: "accepted"
      ),
      Participation.create!(
        tasting: tastings[:gelato],
        user: users[:jules],
        host: false,
        initial_message: Faker::Lorem.sentence,
        status: "accepted"
      ),
      Participation.create!(
        tasting: tastings[:gelato],
        user: users[:max],
        host: false,
        initial_message: Faker::Lorem.sentence,
        status: "accepted"
      )
    ],
    }
}










# Creating categories
categories = {
  pizza: Category.create!(name: "Pizza"),
  chocolate: Category.create!(name: "Chocolate"),
  coffee: Category.create!(name: "Coffee"),
  beer: Category.create!(name: "Beer"),
  wine: Category.create!(name: "Wine"),
  pasta: Category.create!(name: "Pasta"),
  sandwich: Category.create!(name: "Sandwich"),
  vietnamese: Category.create!(name: "Vietnamese"),
  italian: Category.create!(name: "Italian"),
  japanese: Category.create!(name: "Japanese"),
  chinese: Category.create!(name: "Chinese"),
  salad: Category.create!(name: "Salad"),
  gelato: Category.create!(name: "Gelato"),
  healthy: Category.create!(name: "Healthy"),
  sweet: Category.create!(name: "Sweet"),
  sour: Category.create!(name: "Sour"),
  spice: Category.create!(name: "Spicy"),
  salty: Category.create!(name: "Salty"),
  taco: Category.create!(name: "Taco"),
  fried: Category.create!(name: "Fried"),
  chicken: Category.create!(name: "Chicken"),
  Vegetarian: Category.create!(name: "Vegetarian"),
  vegan: Category.create!(name: "Vegan"),
  tea: Category.create!(name: "Tea"),
  barbeque: Category.create!(name: "Barbeque"),
  ipa: Category.create!(name: "IPA"),
  local_product: Category.create!(name: "Local")
}

# Creating Categorizations
categorizations_for_tastings = {
  milk: [
    Categorization.create!(
      category: categories[:chocolate],
      tasting: tastings[:milk]
    ),
    Categorization.create!(
      category: categories[:sweet],
      tasting: tastings[:milk]
    )
  ],
  beans: [
    Categorization.create!(
      category: categories[:chocolate],
      tasting: tastings[:beans]
    ),
    Categorization.create!(
      category: categories[:sweet],
      tasting: tastings[:beans]
    )
  ],
  coffee_tasting: [
    Categorization.create!(
      category: categories[:coffee],
      tasting: tastings[:coffee_tasting]
    )
  ],
  dark: [
    Categorization.create!(
      category: categories[:chocolate],
      tasting: tastings[:dark]
    ),
    Categorization.create!(
      category: categories[:sweet],
      tasting: tastings[:dark]
    )
  ],
  gelato: [
    Categorization.create!(
      category: categories[:gelato],
      tasting: tastings[:gelato]
    ),
    Categorization.create!(
      category: categories[:sweet],
      tasting: tastings[:gelato]
    )
  ],
  vintage: [
    Categorization.create!(
      category: categories[:wine],
      tasting: tastings[:vintage]
    )
  ],
  pizza: [
    Categorization.create!(
      category: categories[:pizza],
      tasting: tastings[:pizza]
    )
  ],
  bbq: [
    Categorization.create!(
      category: categories[:barbeque],
      tasting: tastings[:barbeque]
    )
  ],
  banh: [
    Categorization.create!(
      category: categories[:sandwich],
      tasting: tastings[:banh_mi]
    ),
    Categorization.create!(
      category: categories[:vietnamese],
      tasting: tastings[:banh_mi]
    )
  ],
  tea: [
    Categorization.create!(
      category: categories[:tea],
      tasting: tastings[:tea]
    )
  ],
  beer: [
    Categorization.create!(
      category: categories[:beer],
      tasting: tastings[:beer]
    ),
    Categorization.create!(
      category: categories[:ipa],
      tasting: tastings[:beer]
    )
  ],
  spice: [
    Categorization.create!(
      category: categories[:spice],
      tasting: tastings[:spice]
    )
  ],
  italian: [
    Categorization.create!(
      category: categories[:pasta],
      tasting: tastings[:italian]
    ),
    Categorization.create!(
      category: categories[:pizza],
      tasting: tastings[:italian]
    ),
    Categorization.create!(
      category: categories[:italian],
      tasting: tastings[:italian]
    )
  ],
  fried: [
    Categorization.create!(
      category: categories[:fried],
      tasting: tastings[:fried]
    ),
    Categorization.create!(
      category: categories[:barbeque],
      tasting: tastings[:fried]
    )
  ],
  taco: [
    Categorization.create!(
      category: categories[:taco],
      tasting: tastings[:taco]
    ),
    Categorization.create!(
      category: categories[:healthy],
      tasting: tastings[:taco]
    )
  ]
}



puts "All done!"
