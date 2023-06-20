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
  get 'commodities/home', to: "commodities#home", as: "commodity_home"
  get 'customers/top_customers/:task', to: "customers#top_customers", as: "top_customers"
  get 'orders/filtered_orders', to: "orders#filtered_orders", as: "filtered_orders"
  get 'order/search', to: "orders#search"
  get 'employee/email/search', to: "employees#search"
  get 'employee/increment/:id', to: "employees#increment", as: "order_increment"
  get 'employee/decrement/:id', to: "employees#decrement", as: "order_decrement"
  get 'employee/all_employees', to: "employees#all_employees", as: "all_employees"
  get 'employee/filtered_employees', to: "employees#filtered_employees", as: "filtered_employees"
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
  resources :commodities
  resources :customers
  resources :orders
  resources :employees
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "users#index"
end
