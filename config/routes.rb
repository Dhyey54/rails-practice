Rails.application.routes.draw do
  get '/home', to: "home#index"
  get '/search', to: "cars#search"
  get '/download_pdf', to: "cars#download_pdf"
  resources :users
  resources :cars
  resources :products
  resources :books
  resources :authors
  resources :faculties
  resources :students
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
