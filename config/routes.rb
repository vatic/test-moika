Moika::Application.routes.draw do
  resources :car_washes

  root 'map#show'
  get "map/show"
end
