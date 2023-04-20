Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  patch 'admin/users/:id/edit', controller: 'admin/users', action: :update
  root to: "home#index"
  post 'admin/categories/new', controller: 'admin/categories', action: :create
  patch 'admin/categories/:id/edit', controller: 'admin/categories', action: :update

  resources :users, only: [:show, :edit, :update]
  resources :words, only: [:show]
  resources :categories, only: [:index, :show]
  resources :imports do
    collection {post :import}
  end
  namespace :admin do
    resources :users, only: [:index, :edit, :update, :destroy]
    resources :categories, only: [:index, :edit, :update, :new, :create, :destroy]
    resources :words, only: [:index, :edit, :update, :new, :create, :show, :destroy]
  end
end
