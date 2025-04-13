Rails.application.routes.draw do
  root to: 'homes#top'
  get "homes/about", to: "homes#about", as: "about"
  resources :books, only: [:index, :edit, :show, :create, :destroy]
  resources :users, only: [:index, :edit, :show, :update]
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
