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
  resources :employees
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "users#index"
end
