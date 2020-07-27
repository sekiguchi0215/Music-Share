Rails.application.routes.draw do
  devise_for :users
  
  resources :users
  resources :songs do
  	resources :comments, only: [:create, :destroy]
  	resources :favorites, only: [:create, :destroy]
  end

  root "users#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
