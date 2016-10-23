Rails.application.routes.draw do
  root "static_pages#home"
  get "search(/:search)" => "searches#index", as: :search
  devise_for :users, controllers: {registrations: "registrations",
    omniauth_callbacks: "users/omniauth_callbacks"}
  resources :products
  resources :carts
end
