# top_30 = %w(233 987 559 1628 6036 8173 533 1942 1020 20 239 127 501 72 7331 974 27081 1905 7360 121 2691 529 12517 11198 4754 36872 1331 2350 9061 434)

User.destroy_all
State.destroy_all

# User Leo
User.create!({
  first_name: "Leo",
  last_name: "Thomas",
  password: "shitty-password",
  email: "leo@hotmail.com"
})

[866, 634, 310, 327, 239, 1184].each do |game|
  State.create!({
    user_id: User.last.id,
    game: Game.find_with_igdb(game),
    state: "like"
  })
end

# User Capy
User.create!({
  first_name: "Capy",
  last_name: "Bara",
  password: "elcapy-password",
  email: "elcapy@hotmail.com"
})

[7236, 21357, 7238].each do |game|
  State.create!({
    user_id: User.last.id,
    game: Game.find_with_igdb(game),
    state: "like"
  })
end

# User Mister
User.create!({
  first_name: "Mister",
  last_name: "Bean",
  password: "bean-password",
  email: "bean@hotmail.com"
})

[1985, 427, 11156, 7331, 37094, 1068, 1802, 26758, 7346, 740].each do |game|
  State.create!({
    user_id: User.last.id,
    game: Game.find_with_igdb(game),
    state: "like"
  })
end

# User LeBron
User.create!({
  first_name: "LeBron",
  last_name: "James",
  password: "lebron-password",
  email: "lebron@hotmail.com"
})

[36847, 26772, 27081, 1020, 559, 1905, 529].each do |game|
  State.create!({
    user_id: User.last.id,
    game: Game.find_with_igdb(game),
    state: "like"
  })
end


# User Nic
User.create!({
  first_name: "Nic",
  last_name: "Fan",
  password: "test123",
  email: "nicfan@hotmail.com"
})

[233, 6036, 8173, 501, 20, 17447, 27081, 538, 1905, 11198].each do |game|
  State.create!({
    user_id: User.last.id,
    game: Game.find_with_igdb(game),
    state: "like"
  })
end

# User Aanush
User.create!({
  first_name: "Aanush",
  last_name: "Puttel",
  password: "aanush-password",
  email: "aanush@yahoo.com"
})

[36847, 26772, 27081, 1011, 7351, 740, 4179, 120].each do |game|
  State.create!({
    user_id: User.last.id,
    game: Game.find_with_igdb(game),
    state: "like"
  })
end

# User Martin
User.create!({
  first_name: "Martin",
  last_name: "G",
  password: "martin-password",
  email: "martin@hotmail.com"
})

[43305, 4176, 2110, 2192, 990, 75, 114, 2768, 3060, 4756].each do |game|
  State.create!({
    user_id: User.last.id,
    game: Game.find_with_igdb(game),
    state: "like"
  })
end

# User Master
User.create!({
  first_name: "Master",
  last_name: "Chief",
  password: "chief-password",
  email: "john117@hotmail.com"
})

[740, 986, 2591, 1638, 1089, 547, 71, 2342, 1628, 1074].each do |game|
  State.create!({
    user_id: User.last.id,
    game: Game.find_with_igdb(game),
    state: "like"
  })
end
