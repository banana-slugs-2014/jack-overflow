JackOverflow::Application.routes.draw do

  root to: "posts#index"
  post '/posts', to: "posts#create", as: "create_post"

  resources :posts, except: :destroy do
    resources :comments, except: [:index, :show]
    resources :votes, only: [:create, :update]
  end

  resources :sessions, only: [:new, :create, :destroy]
  get '/signin', to: 'sessions#new', as: 'sign_in'
  post '/signout', to: 'sessions#destroy', as: 'sign_out'


  resources :users, except: [:new, :show]
  get '/profile', to: 'users#show', as: 'profile'
  get '/signup', to: 'users#new', as: 'sign_up'

  # resources :votes, only: [:create, :update]
end
