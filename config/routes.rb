Rails.application.routes.draw do

  devise_for :users
  root to: "recipes#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "dashboard", to: "pages#dashboard"
  resources :users, only: [] do
    resources :recipes, only: %i[create update]
  end
  resources :recipes, only: %i[index show destroy]
end
