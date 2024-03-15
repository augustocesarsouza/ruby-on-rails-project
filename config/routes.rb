Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index" #home ali é controller, index ali é action

  # namespace - você Separaria em rotas ficaria tipo admin/category/categories <- SE eu colocar namespace ASSIM "namespace:category e resources :categories dentro"  
  # MAS acho que nao faz sentido agora / tentar fazer depois esse jeito de separar namespace
  # nesse jeito teria um "app>controllers>category>categories_controller.rb" ai criaria o namespace
  namespace :admin do
    root to: "home#index"
    
    resources :categories
    resources :products
  end
end
