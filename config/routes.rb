

Rails.application.routes.draw do
  
  get 'likes/create'
  get 'likes/destroy'

  get 'relationships/create'
  get 'relationships/destroy'

  get 'microposts/create'
  get 'microposts/destroy'

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'

  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  
  get 'users/:id/likes', to: 'users#likes_2', as: 'likes_user'
  
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
      get :likes_2
    end
  end
  
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  
end
