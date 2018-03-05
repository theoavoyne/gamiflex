Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  get '/profile', to: "pages#profile"
  get '/games/:id', to: "pages#games"

end
