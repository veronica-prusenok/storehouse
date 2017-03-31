Rails.application.routes.draw do
  devise_for :users
  root "welcome#index"

  post '/', controller: :welcome, action: :search
  get '/show', controller: :welcome, action: :search

  namespace :users do
    resources :manage, controller: :manage, only: :index
  end
  namespace :products do
    resources :manage, controller: :manage
  end
  namespace :orders do
    resources :manage, controller: :manage
  end
end
