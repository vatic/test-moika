Moika::Application.routes.draw do

  get "normal_users/show"
  root 'map#show'
  get "map/show"

  get "sp/:id", to: "static_pages#show", as: "static_page"
  get "banners/update"

  get "user/:id", to: "users#show", as: '/user'
  get "users/registration", to: "users#registration", as: 'registration'
  get "users/login", to: "users#login", as: 'login'

  get "normal_user/:id", to: "normal_users#show", as: '/normal_user'

  devise_for :users, controllers: { registrations: "registrations" }
  devise_for :normal_users, controllers: { registrations: "registrations" }

  resources :car_washes do
    get :update_map, on: :collection
    resources :comments, only: [:index, :create]
    resources :requests
    resources :messages, only: [:index, :show, :update]
    resources :normal_user_messages
    resources :banners, only: [:index, :update]
    resources :payments, only: [:index]
    resources :invoices, only: [:new, :create, :show]
    delete 'delete_file/:id', to: 'banners#delete_file', as: '/delete_file'
  end

  put 'car_washes/:id/update_main_action', to: 'car_washes#update_main_action', as: '/car_washes_update_main_action'
  post 'car_washes/:id/subscribe/:user_id', to: 'car_washes#subscribe', as: '/car_washes_subscribe'

  controller :robokassa do
    get "robokassa/:notification_key/notify"   => :notify,  :as => :robokassa_notification

    get "robokassa/success"  => :success, :as => :robokassa_on_success
    get "robokassa/fail"     => :fail,    :as => :robokassa_on_fail
  end

  namespace :admin do
    get '', to: 'dashboard#main', as: '/'
    get 'load_data_from_ya', to: 'dashboard#load_data_from_ya', as: '/load_data_from_ya'
    resources :users
    resources :messages, only: [:index, :show, :create, :destroy]
    resources :banners
    resources :static_pages
    resources :car_washes
    get 'add_car_wash/:id', to: 'users#add_car_wash', as: '/add_car_wash'
    delete 'delete_file/:id', to: 'banners#delete_file', as: '/delete_file'
  end
  match "*path" => redirect("/"), via: :all
end
