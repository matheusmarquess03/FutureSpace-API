Rails.application.routes.draw do
  resources :locations
  resources :pads
  resources :orbits
  resources :missions
  resources :configurations
  resources :rockets
  resources :launch_service_providers
  resources :statuses
  resources :launchers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
