Rails.application.routes.draw do
  devise_for :users
  
  root "users#index"
  #get 'users/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:new, :create]
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
