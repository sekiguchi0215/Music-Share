Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:index, :edit, :show, :update] do
  	member do
  		get :followings, :followers
      get :favorites
  	end
    collection do
      get "search"
    end
  end
  resources :relationships, only: [:create, :destroy]

  resources :songs do
  	resources :comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
    collection do
      get "search"
    end
  end

  resources :notifications, only: [:index]

  root "songs#top"

  get "about" => "songs#about"

  post "/users/guest_sign_in" => 'users#new_guest'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
