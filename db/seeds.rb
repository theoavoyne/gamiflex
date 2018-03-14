# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

top_70 = %w(233 987 559 1628 6036 8173 533 1942 1020 20 239 127 501 72 7331 974 27081 1905 7360 121 2691 529 12517 11198 4754 36872 1331 2350 9061 434 7334 1029 472 1011 7351 11133 1968 885 7599 43 1164 9630 109 1985 866 1377 17447 11157 7292 7205 19470 3212 36847 26772 38 1981 3035 1267 960 11156 37094 114 4756 1802 37059 6732 4179 539 120 1062)

User.destroy_all
State.destroy_all

User.create!({
  first_name: "Leo",
  last_name: "Thomas",
  password: "shitty-password",
  email: "leo@hotmail.com"
})

User.create!({
  first_name: "Capy",
  last_name: "Bara",
  password: "elcapy-password",
  email: "elcapy@hotmail.com"
})

User.create!({
  first_name: "Mister",
  last_name: "Bean",
  password: "bean-password",
  email: "bean@hotmail.com"
})

User.create!({
  first_name: "LeBron",
  last_name: "James",
  password: "lebron-password",
  email: "lebron@hotmail.com"
})

User.create!({
  first_name: "Nic",
  last_name: "Fan",
  password: "test123",
  email: "nicfan@hotmail.com"
})

User.create!({
  first_name: "Aayush",
  last_name: "Patel",
  password: "aayush-password",
  email: "aayush@yahoo.com"
})

User.create!({
  first_name: "Martin",
  last_name: "G",
  password: "martin-password",
  email: "martin@hotmail.com"
})

User.create!({
  first_name: "Master",
  last_name: "Chief",
  password: "chief-password",
  email: "john117@bungie.com"
})

30.times do
  State.create({
    user: User.all.sample,
    game: Game.find_with_igdb(top_70.sample),
    state: "like"
  })
end
