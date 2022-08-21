Rails.application.routes.draw do
  get 'reviews/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'lists#index'

  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end

  resources :bookmarks, only: [:destroy]
end
