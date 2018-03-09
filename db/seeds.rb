# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

top_30 = %w(233 987 559 1628 6036 8173 533 1942 1020 20 239 127 501 72 7331 974 27081 1905 7360 121 2691 529 12517 11198 4754 36872 1331 2350  9061 434)


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

30.times do
  State.create({
    user: User.all.sample,
    game: Game.find_with_igdb(top_30.sample),
    state: "like"
  })
end
