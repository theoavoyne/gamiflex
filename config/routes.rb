Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  get '/profile', to: "pages#profile"
  get '/games/:id', to: "pages#games", as: 'game'

  resources :states, only: [ :create, :destroy ]

  # resources :games, only: [ :show ] do
  #   resources :state, only: [ :create, :destroy ]
  # end

  post '/games/:game_id/state', to: 'states#create', as: 'game_states'
end
