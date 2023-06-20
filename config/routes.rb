Rails.application.routes.draw do

  root "commodities#index"

  get '/home', to: "home#index"

  get '/search', to: "cars#search"

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

  get 'orders/filtered_orders', to: "orders#filtered_orders", as: "filtered_orders"
  get 'order/search', to: "orders#search"
  resources :users
  resources :cars
  resources :products
  resources :books
  resources :authors
  resources :faculties
  resources :students

  resources :commodities do
    resources :orders, except: %i[index show destroy]
  end

  namespace :business do
    resources :customers, except: %i[show destroy] do
      member do
        delete 'delete_customer', action: :delete_customer, controller: 'customers'
        get 'preview', action: :preview, controller: 'customers'
      end
      collection do
        get 'customer_search', action: :search, controller: 'customers'
        get 'top_customers/:task', to: "customers#top_customers", as: "top_customers"
      end
    end
  end

  resources :orders, only: %i[index show destroy]
  resources :employees do
    member do
      get 'increment', to: "employees#increment", as: "order_increment"
      get 'decrement', to: "employees#decrement", as: "order_decrement"
    end
    collection do
      get 'email/search', to: "employees#search"
      get 'all_employees', to: "employees#all_employees", as: "all"
      get 'filtered_employees', to: "employees#filtered_employees", as: "filtered"
    end
  end

  namespace :api do
    namespace :v1 do
      resources :tests, only: :index
      get 'customer_data', action: :customer_data, controller: 'tests'
      get 'commodity_data', action: :commodity_data, controller: 'tests'
      get 'order_data', action: :order_data, controller: 'tests'
      get 'all_data', action: :all_data, controller: 'tests'
    end
  end
  resources :events
  resources :profile
  resources :comments
  resources :addresses, only: %i[edit update]
  resources :commodities
  resources :customers
  resources :orders
  resources :employees
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
