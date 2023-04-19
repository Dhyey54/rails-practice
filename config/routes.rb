Rails.application.routes.draw do
  get '/home', to: "home#index"
  get '/search', to: "cars#search"
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
  resources :commodities
  resources :customers
  resources :orders
  resources :employees
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "users#index"
end
