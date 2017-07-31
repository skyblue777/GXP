Rails.application.routes.draw do

  resources "contacts", only: [:new, :create]

  namespace :admin do
    resources :projects
  end
  get 'change_country_code/:country_code', to: 'application#change_country_code'
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  mount Avocado::Engine => '/avocado', constraints: -> (_) { Rails.env.staging? }

  devise_for :users, path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register'
  }, controllers: {
    registrations: 'registrations',
    sessions: 'sessions'
  }


  devise_scope :user do
    post "/update_password" => "registrations#update_password"
  end


  devise_for :admin, skip: [:registrations], path_names: {
    sign_in: 'login',
    sign_out: 'logout'
  }, controllers: {
    sessions: 'admin/sessions'
  }

  namespace 'admin' do
    resources :contests
    resources :categories
    resources :orders
    resources :contests do
      resources :winners, on: :index
    end
    resources :products
    resources :admins_policy
    post "admins_policy" => "admins_policy#create", as: "admin_admins_policy"
    resources :projects, only: [:show, :edit, :destroy]
    resources :sponsors
    resources :subscriptions do
      member do
        get :enable
        get :disable
      end
    end
    resources :subscription_plans
    resources :admins, as: 'registrations', path: '', except: [:show]
    root to: 'admins#index'
    resources :payments do
      member do
        get :refund
      end
    end

  end

  resources :contests, only: [:index, :show] do
    resources :projects
    resources :categories, only: [] do
      resources :projects, only: :index
    end
  end

  get 'checkout' => 'orders#checkout'
  get 'paypal_response/:amount' => "orders#paypal_response", as: "paypal_response"
  get "sub_paypal_response" => "subscriptions#paypal_response", as: "sub_paypal_response"
  get "renew_paypal_response" => "subscriptions#renew_paypal_response", as: "renew_paypal_response"
  get "resend_otp" => "orders#resend_otp"
  get 'cart' => 'carts#show'
  resources :order_products, only: [:create, :update, :destroy]
  
  resources :addresses
  resources :categories, only: [] do
    resources :projects, only: :index
  end

  resources :group_invitations, only: [:destroy] do
    get :accept, on: :collection
  end

  resources :products, only: [:index, :download_url] do
    member do 
      get 'download_url'
    end
  end

  resources :projects do
    get :step2, on: :member
    post :finalize, on: :member
    resources :groups, only: [:new, :create, :edit, :update]
    resources :votes, only: [:create]
    resources :comments, only: [:index, :create]
  end

  resources :subscriptions do
    collection do
      post :process_card
      get :renew
      get :cancel
      # post :paypal_response
    end
  end
  
  resources :sponsors, only: [:new, :create]

  resources :users, only: [:show, :index] do
    get :profile, on: :collection
    patch :update_code, on: :member
  end

  resource :s3, only: [] do
    get :bucket_url
  end

  get "s3/url" => "s3#signed_url"
  get "users_order/:order_id" => "users#users_order", as: "users_order"
  get "about" => "pages#about"
  get "join" => "pages#join"
  get "advertising" => "pages#advertising"
  get "/send_request" => "pages#send_request", as: "send_request"
  get "/request_dashboard" => "pages#request_dashboard", as: "request_dashboard"
  post "/send_request_post" => "pages#send_request_post"
  post "/order_shiping" => "admin/orders#order_shiping"
  get "tos" => "pages#tos"
  get "/delete_images/:project_id/:img_id" => "projects#delete_images", as: "delete_images"

  resources :orders, only: [:show, :index] do
    member do 
      get :complete
    end
    collection do
      post :process_card
    end
  end

  resources :emails, only: [:new, :create]

  authenticated :user do
    # root to: 'projects#index', as: :authenticated_root
    root to: 'pages#home', as: :authenticated_root
  end

  root to: 'pages#home'
end
