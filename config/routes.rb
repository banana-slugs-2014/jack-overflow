JackOverflow::Application.routes.draw do

  root to: "posts#index"
  post '/posts', to: "posts#create", as: "create_post"

  resources :posts, except: :destroy do
    resources :comments, except: [:index, :show]
  end

  resources :sessions, only: [:new, :create, :destroy]
  get '/signin', to: 'sessions#new'
  post '/signout', to: 'sessions#destroy'


  resources :users, except: [:new, :show]
  get '/profile', to: 'users#show'
  get '/signup', to: 'users#new'

  resources :votes, only: [:create, :update]
end
