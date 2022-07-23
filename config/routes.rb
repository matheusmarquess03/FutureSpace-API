Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  get '/', to: 'application#index'

  resources :launchers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
