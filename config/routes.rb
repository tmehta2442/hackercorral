Hackercorral::Application.routes.draw do

	get 'signup',  to: 'users#new', as: 'signup'
	get 'signin',  to: 'sessions#new', as: 'signin'
	get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'event',   to: 'events#index', as: 'event'
  
  root :to => 'users#index'
  # get "users/about"
  get "site/about"
  get "site/help"

  resources :users
  resources :sessions
  resources :events
  # resources :site
  
end
