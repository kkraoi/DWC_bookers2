Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "home/about", to: "homes#about", as: "about"
  
  resources :books, only: [:index, :edit, :create, :show, :update, :destroy]

  resources :users, only: [:index, :edit, :show, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
