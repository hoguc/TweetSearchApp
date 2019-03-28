Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  root 'home#index'
  get 'home/index'
  get 'tweets/search', to: 'tweets#search', as: 'search_tweet'
  post 'likes/create', to: 'likes#create', as: 'create_likes'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
