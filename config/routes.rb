Moika::Application.routes.draw do

  root 'map#show'
  get "map/show"

  get "sp/:id", to: "static_pages#show", as: "static_page"
  get "banners/update"
  get "user/:id", to: "users#show", as: '/user'
  devise_for :users, controllers: { registrations: "registrations" }
  resources :car_washes do
    get :update_map, on: :collection
    resources :comments, only: [:index, :create]
    resources :requests
    resources :messages, only: [:index, :show, :update]
    resources :banners, only: [:index, :update]
    resources :payments, only: [:index]
    resources :invoices, only: [:new, :create, :show]
    delete 'delete_file/:id', to: 'banners#delete_file', as: '/delete_file'
  end

  put 'car_washes/:id/update_main_action', to: 'car_washes#update_main_action', as: '/car_washes_update_main_action'

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
