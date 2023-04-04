Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  patch 'admin/users/:id/edit', controller: 'admin/users', action: :update
  root to: "home#index"

  resources :users, only: [:show, :edit, :update]
  resources :words, only: [:show]
  resources :categories, only: [:index, :show]
  resources :imports do
    collection {post :import}
  end
  namespace :admin do
    resources :users, only: [:index, :edit, :update, :destroy]
  end
end
