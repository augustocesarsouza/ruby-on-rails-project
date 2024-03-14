Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index" #home ali é controller, index ali é action

  namespace :admin do
    root to: "home#index"
  end
end
