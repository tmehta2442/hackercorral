Hackercorral::Application.routes.draw do
  root :to => 'users#index'
  # get "users/about"
  resources :users
  resources :site
  
end
