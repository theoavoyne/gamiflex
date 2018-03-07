# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

State.create!({
  user: User.last,
  game_id: "27081",
  state: "like"
})

State.create!({
  user: User.last,
  game_id: "27082",
  state: "like"
})

State.create!({
  user: User.last,
  game_id: "27083",
  state: "like"
})

State.create!({
  user: User.first,
  game_id: "27081",
  state: "like"
})

State.create!({
  user: User.first,
  game_id: "27080",
  state: "like"
})
