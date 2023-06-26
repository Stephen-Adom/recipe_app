Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "user#index"

  resources :recipes, only: [:index, :new, :create, :show] do
    resources :shopping_list, only: [:index]
  end
  resources :food, only: [:index, :new, :create]
end
