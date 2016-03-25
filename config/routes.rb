Rails.application.routes.draw do

  namespace :admin do
  get 'users/index'
  end

  root "projects#index"
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"

  resources :projects do
    resources :tickets
  end

  resources :users
end
