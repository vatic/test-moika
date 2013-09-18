Moika::Application.routes.draw do
  get "users/index"
  devise_for :users
  resources :car_washes

  root 'map#show'
  get "map/show"

  get "map/show"

  namespace :admin do
    get '', to: 'dashboard#main', as: '/'
    get 'load_data_from_ya', to: 'dashboard#load_data_from_ya', as: '/load_data_from_ya'
    resources :users
    get 'add_car_wash/:id', to: 'users#add_car_wash', as: '/add_car_wash'

  end
end
