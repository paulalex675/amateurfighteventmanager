Rails.application.routes.draw do
  resources :fights do
    resources :likes, module: :fights
    resources :comments, module: :fights
  end
  resources :events do
    resources :likes, module: :events
  end
  resources :fight_records
  resources :fight_profiles
  resources :gyms do
    resources :likes, module: :gyms
    resources :addresses, module: :gyms
  end
  resources :addresses
  resources :notifications
  resources :likes
  resources :friend_requests
  resources :friendships
  resources :posts do
    resources :likes, module: :posts
    resources :comments, module: :posts
  end
  resources :comments do
    resources :likes, module: :comments
  end
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth' }
  resources :users, only: [:show, :index]
  root 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
