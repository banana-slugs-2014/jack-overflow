JackOverflow::Application.routes.draw do

  root to: "posts#index"
  resources :posts, except: :destroy
  resources :sessions, only: [:new, :create, :destroy]
  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'

  resources :users, except: [:new, :show]
  get '/profile', to: 'users#show'
  get '/signup', to: 'users#new'


end
