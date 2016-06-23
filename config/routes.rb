Rails.application.routes.draw do

  namespace :admin do
    root :to => "base#index"
    resources :users do
      resources :permissions
      resources :states

      put "permissions", to: "permissions#set",
                        as: "set_permissions"
    end
  end

  root "projects#index"
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"

  delete "/signout", to: "sessions#destroy", as: "signout"

  resources :projects do
    resources :tickets
  end

  resources :tickets do
    resources :comments
  end

  resources :users
  resources :files
end
