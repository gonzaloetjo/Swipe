Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'



  resources :products
  resources :categories
  resources "offers" do
    resources "messages"
  end
  #resources :favorites, exept: %i[create]
  get "/offers/new/:id" => "offers#new"
  get "/offers/chat/:id" => "offers#chat"
  get "/offers/offer/:id" => "offers#create"
  get "/search" => "search#search", as: :search
  get "/favorites" => "favorites#favorites", as: :favorites
  #get "/offers" => "offer#offer", as: :offer

  #post "/o"
  post "create", to: "mother_categories#create"
  post "/approve/:id" => "search#approve", as: :approve_product
  post "/decline/:id" => "search#decline", as: :decline_product
  post "get/startoffers/:id" => "search#startoffers", as: :startoffers


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
