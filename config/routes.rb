Rails.application.routes.draw do
  get 'likes/create/:commentid/:eventid', to: "likes#create", as: "like"
  get 'likes/destroy/:commentid/:eventid', to: "likes#destroy", as: "dislike"
  get 'enrollments', to: "enrollments#index"
  get 'comment/event_comments/:eventid', to: "comments#event_comments", as: "event_comments"
  get "/comments/create/:eventid", to: "comments#create", as: "create_comments"
  get "/comments/new/:eventid", to: "comments#new", as: "new_comment"
  get 'comment/user_comments', to: "comments#user_comments", as: "user_comments"
  get 'enrollments/create/:eventid', to: "enrollments#create", as: "create_enrollment"
  get '/home', to: "home#index"
  get 'cars/search', to: "cars#search"
  get 'events/search', to: "events#search"
  get '/download_pdf', to: "cars#download_pdf"
  resources :users
  resources :cars
  resources :products
  resources :books
  resources :authors
  resources :faculties
  resources :students
  resources :events
  resources :profile
  resources :comments
  resources :addresses, only: %i[edit update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "users#index"
end
