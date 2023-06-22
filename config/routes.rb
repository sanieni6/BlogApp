Rails.application.routes.draw do
  devise_for :users
  
  root "users#index"
  #get 'users/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:new, :create]
    end
  end
  
  get 'posts/user:id', to: 'posts#user_posts', as: :posts_user
  get 'comments/post:id', to: 'comments#post_comments', as: :comments_post

  # Defines the root path route ("/")
  # root "articles#index"
end
