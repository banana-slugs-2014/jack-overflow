JackOverflow::Application.routes.draw do

  resources :posts, except: :destroy
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  root to: "posts#index"
  get '/profile', to: 'users#show'
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'


end
