Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :products, exept: %i[create]
  resources :categories, exept: %i[create]
  #resources :favorites, exept: %i[create]

  get "/search" => "search#search", as: :search
  get "/favorites" => "favorites#favorites", as: :favorites


  post "create", to: "mother_categories#create"
  post "/approve/:id" => "search#approve", as: :approve_product
  post "/decline/:id" => "search#decline", as: :decline_product


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
