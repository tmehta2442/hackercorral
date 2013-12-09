Hackercorral::Application.routes.draw do
  root :to => 'users#index'
  # get "users/about"
  get "site/about"
  get "site/help"

  resources :users
  # resources :site


end
