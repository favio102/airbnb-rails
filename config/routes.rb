# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  namespace :api do
    resources :users, only: :show
  end
end
