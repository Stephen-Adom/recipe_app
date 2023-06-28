Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "user#index"

  resources :recipes do
    resources :shopping_list, only: [:index]
  end
  resources :food
end
