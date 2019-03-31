Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  root 'home#index'
  get 'home/index', to: 'home#index', as: 'index_home'
  get 'tweets/search', to: 'tweets#search', as: 'search_tweet'
  get 'tweets/top', to: 'tweets#top', as: 'top_tweets'
  get 'likes/index', to: 'likes#index', as: 'index_like'
  post 'likes/create', to: 'likes#create', as: 'create_likes'
  post 'likes/destroy', to: 'likes#destroy', as: 'destroy_likes'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
