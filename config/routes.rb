Rails.application.routes.draw do
  get '/home', to: "home#index"
  resources :products
  resources :books
  resources :authors
  # Defualt page shown on localhost:3000 is defined by root
  root "books#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
