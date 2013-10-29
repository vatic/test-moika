Moika::Application.routes.draw do

  get "users/index"
  devise_for :users
  resources :car_washes do
    get :update_map, on: :collection
    resources :comments
    resources :requests
    resources :messages, only: [:index, :show, :update]
  end

  put 'car_washes/:id/update_main_action', to: 'car_washes#update_main_action', as: '/car_washes_update_main_action'

  root 'map#show'
  get "map/show"

  namespace :admin do
    get '', to: 'dashboard#main', as: '/'
    get 'load_data_from_ya', to: 'dashboard#load_data_from_ya', as: '/load_data_from_ya'
    resources :users
    resources :messages, only: [:index, :show, :create, :destroy]
    get 'add_car_wash/:id', to: 'users#add_car_wash', as: '/add_car_wash'

  end
end
