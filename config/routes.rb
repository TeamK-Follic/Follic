Rails.application.routes.draw do
  root 'items#index'

  get 'carts/confirm'
  get 'users/about'

  devise_for :users

  resources :users, :only => [:show, :index, :edit, :index, :update]
  resources :artists
  resources :items
  resources :events, :only => [:new, :show, :edit, :create, :update, :destroy]
  resources :discs, :only => [:create, :update, :destroy]
  resources :musics, :only => [:create, :update, :destroy]
  resources :carts, :only => [:index, :create, :update, :destroy]
  resources :cart_histories, :only => [:create]
  resources :histories, :only => [:show, :index, :create, :update]
  resources :following_artists, :only => [:index, :create, :destroy]
  resources :labels, :only => [:index, :edit, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'labels/index'
  # get 'labels/edit'
  # get 'following_artists/index'
  # get 'history/show'
  # get 'history/index'
  # get 'carts/index'
  # get 'events/new'
  # get 'events/show'
  # get 'events/edit'
  # get 'items/new'
  # get 'items/show'
  # get 'items/index'
  # get 'items/edit'
  # get 'artists/new'
  # get 'artists/show'
  # get 'artists/index'
  # get 'artists/edit'
  # get 'users/show'
  # get 'users/index'
  # get 'users/edit'

end
