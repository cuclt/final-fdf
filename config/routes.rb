Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  root "static_pages#home"
  devise_for :users, controllers: {registrations: "registrations",
    omniauth_callbacks: "users/omniauth_callbacks"}
  resources :products
  resources :carts
  resources :comments
  post '/rate' => 'rater#create', :as => 'rate'
end
