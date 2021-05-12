Rails.application.routes.draw do
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
