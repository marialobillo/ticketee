Rails.application.routes.draw do

  root "projects#index"
  get "/signin", to: "sessions#new"

  resources :projects do
    resources :tickets
  end

  resources :users
end
