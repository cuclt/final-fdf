Rails.application.routes.draw do
  root "static_pages#home"
  get "search(/:search)" => "searches#index", as: :search
  devise_for :users, controllers: {registrations: "registrations",
    omniauth_callbacks: "users/omniauth_callbacks"}
  resources :products
  resources :carts
  resources :comments
  resources :orders
  resources :categories, only: :show
  resources :users, only: :show
  resources :suggests, only: [:new, :create]
end
