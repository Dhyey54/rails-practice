Rails.application.routes.draw do
  get '/home', to: "home#index"
  get '/search', to: "cars#search"
  get '/download_pdf', to: "cars#download_pdf"
  get 'commodities/home', to: "commodities#home", as: "commodity_home"
  get 'customers/top_customers/:task', to: "customers#top_customers", as: "top_customers"
  get 'orders/filtered_orders', to: "orders#filtered_orders", as: "filtered_orders"
  get 'order/search', to: "orders#search"
  resources :users
  resources :cars
  resources :products
  resources :books
  resources :authors
  resources :faculties
  resources :students
  resources :commodities
  resources :customers
  resources :orders
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "users#index"
end
