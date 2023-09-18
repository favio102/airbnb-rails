# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  namespace :api do
    get "/users_by_email/:email" => "users_by_emails#show", as: :users_by_email
  end
end
