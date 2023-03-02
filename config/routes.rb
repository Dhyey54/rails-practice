Rails.application.routes.draw do
  get '/home', to: "home#index"
  # root "home#index"

  resources :products

  # Defualt page shown on localhost:3000 is defined by root
  root "products#index"

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
