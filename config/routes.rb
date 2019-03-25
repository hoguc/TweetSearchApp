Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  get 'tweets/search', to: 'tweets#search', as: 'search_tweet'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
