Rails.application.routes.draw do
  root "static_pages#home"
  devise_for :users, controllers: {registrations: "registrations",
    omniauth_callbacks: "users/omniauth_callbacks"}
  resources :products
  resources :carts
  resources :orders
end
