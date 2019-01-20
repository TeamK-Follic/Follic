Rails.application.routes.draw do

  root 'items#index'

  get 'carts/confirm'
  get 'users/about'
  get 'events/new/:id' => 'events#new', as: 'new_event'
  get 'items/new/:id' => 'items#new', as: 'new_item'

  devise_for :managers
  #, :controllers => {
  #  :sessions => 'managers/sessions'
  #}



  devise_for :users
  #, :controllers => {
  #  :registrations => 'users/registrations',
  #  :sessions => 'users/sessions'
  #}



  resources :users, :only => [:show, :index, :edit, :update]
  resources :artists do
    resource :following_artists, only: [:create, :destroy]
  end
  resources :items, :only => [:show, :index, :edit, :create, :update, :destroy]
  resources :events, :only => [:show, :edit, :create, :update, :destroy]
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
