Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  get '/profile', to: "pages#profile", as: 'profile'
  get '/mygames', to: "pages#mygames", as: 'mygames'

  resources :games, only: [ :show ] do
    resources :states, only: [ :create, :destroy ]
  end
end
