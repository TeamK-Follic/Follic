Rails.application.routes.draw do
  get 'labels/index'
  get 'labels/edit'
  get 'following_artists/index'
  get 'history/show'
  get 'history/index'
  get 'carts/index'
  get 'carts/confirm'
  get 'events/new'
  get 'events/show'
  get 'events/edit'
  get 'items/new'
  get 'items/show'
  get 'items/index'
  get 'items/edit'
  get 'artists/new'
  get 'artists/show'
  get 'artists/index'
  get 'artists/edit'
  get 'users/about'
  get 'users/show'
  get 'users/index'
  get 'users/edit'
  get 'users/about'
  get 'users/show'
  get 'users/index'
  get 'users/dit'
  get 'users/update'
  devise_for :users

  resources :users, :only => :update
  resources :artists, :only => [:create, :update, :destroy]
  resources :items, :only => [:create, :update, :destroy]
  resources :events, :only => [:create, :update, :destroy]
  resources :discs, :only => [:create, :update, :destroy]
  resources :musics, :only => [:create, :update, :destroy]
  resources :carts, :only => [:create, :update, :destroy]
  resources :cart_histories, :only => [:create]
  resources :histories, :only => [:create, :update]
  resources :following_artists, :only => [:create, :destroy]
  resources :labels, :only => [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
