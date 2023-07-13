Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :books, only: [:new, :create, :index, :show, :destroy,:edit,:update]do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  get "/home/about" => "homes#about", as: "about"
  resources :users, only: [:show, :edit,:update,:index]do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

end
