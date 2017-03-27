Rails.application.routes.draw do
  devise_for :users
  root "welcome#index"

  namespace :users do
    resources :manage, controller: :manage, only: :index
  end
end
