Rails.application.routes.draw do

  devise_for :users
  root to: "recipes#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "user", to: "pages#user"
  # Defines the root path route ("/")
  # root "articles#index"
  get "dashboard", to: "pages#dashboard"
  get "logo", to: "logos#logo"

  resources :users, only: [] do
    resources :recipes, only: %i[create update]
  end
  resources :recipes, only: [] do

    resources :bookings, only: %i[new create]
  end
  resources :recipes, only: %i[index show destroy]
  resources :bookings, only: %i[edit update]

  patch 'bookings/:id/accepted', to: "bookings#accepted", as: 'accepted'
  patch 'bookings/:id/declined', to: "bookings#declined", as: 'declined'

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

end
