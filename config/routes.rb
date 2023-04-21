Rails.application.routes.draw do
  root "commodities#index"

  get '/home', to: "home#index"

  get '/search', to: "cars#search"
  get '/download_pdf', to: "cars#download_pdf"

  get 'commodities/home', to: "commodities#home", as: "commodity_home"

  
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
  resources :employees

  namespace :api do
    namespace :v1 do
      resources :tests, only: :index
      get 'customer_data', action: :customer_data, controller: 'tests'
      get 'commodity_data', action: :commodity_data, controller: 'tests'
      get 'order_data', action: :order_data, controller: 'tests'
      get 'all_data', action: :all_data, controller: 'tests'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
