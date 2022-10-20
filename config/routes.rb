Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "posts#index"
  resources :users
  resources :profiles
  resources :posts
  resources :attachments
  resources :likes
  resources :comments
  resources :friend_requests
  resources :friends
  
end
