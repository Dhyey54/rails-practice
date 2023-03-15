Rails.application.routes.draw do
  get '/home', to: "home#index"
  resources :products
  resources :books
  resources :authors
  resources :faculties
  resources :students
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "faculties#index"
end
