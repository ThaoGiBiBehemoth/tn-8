Rails.application.routes.draw do
  resources :users
  resources :tasks
  resources :items
  post "/login", to: "users#login"
end