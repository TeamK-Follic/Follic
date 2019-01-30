Rails.application.routes.draw do

  root 'items#index'

  get 'carts/confirm'
  get 'about' => 'users#about', as: "about"

  devise_for :managers
  devise_for :users

  resources :users, :only => [:show, :index, :edit, :update] do
    resource :following_artists, only: [:create, :destroy]
  end
  resources :artists do
    resource :following_artists, only: [:create, :destroy]
    resource :items, only: [:show, :index, :edit, :create, :destroy]
    resource :events, only: [:new, :show, :edit, :update, :create, :destroy]
  end
  resources :items, :only => [:new, :show, :index, :edit, :create, :update, :destroy] do
    resource :carts, only: [:create, :destroy]
  end
  resources :events, :only => [:new, :show, :edit, :create, :update, :destroy]
  resources :discs, :only => [:create, :update, :destroy]
  resources :musics, :only => [:create, :update, :destroy]
  resources :carts, :only => [:index, :create, :update, :destroy]

  resources :histories, :only => [:show, :index, :create, :update] do
    resource :cart_histories, only: [:create, :destroy]
  end
  resources :cart_histories, :only => [:create]
  resources :following_artists, :only => [:index, :show, :create, :destroy]
  resources :labels, :only => [:index, :edit, :new, :create, :update, :destroy]
  resources :genres, :only => [:new, :create, :edit, :update, :destroy]
  resources :types, :only => [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  patch 'users/d/:id' => 'users#unsubscribe', as: 'unsubscribe_user'

end
