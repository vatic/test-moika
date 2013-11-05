Moika::Application.routes.draw do

  get "banners/update"
  get "users/index"
  devise_for :users
  resources :car_washes do
    get :update_map, on: :collection
    resources :comments, only: [:index, :create]
    resources :requests
    resources :messages, only: [:index, :show, :update]
    resources :banners, only: [:index, :update]
    delete 'delete_file/:id', to: 'banners#delete_file', as: '/delete_file'
  end

  put 'car_washes/:id/update_main_action', to: 'car_washes#update_main_action', as: '/car_washes_update_main_action'

  root 'map#show'
  get "map/show"

  namespace :admin do
    get '', to: 'dashboard#main', as: '/'
    get 'load_data_from_ya', to: 'dashboard#load_data_from_ya', as: '/load_data_from_ya'
    resources :users
    resources :messages, only: [:index, :show, :create, :destroy]
    resources :banners
    get 'add_car_wash/:id', to: 'users#add_car_wash', as: '/add_car_wash'
    delete 'delete_file/:id', to: 'banners#delete_file', as: '/delete_file'

  end
end
