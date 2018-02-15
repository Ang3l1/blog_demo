Rails.application.routes.draw do
  
  resources :categories
  #get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #path for user
  devise_for :users
  #path for articles
  resources :articles do
  	resources :comments, only: [:create, :update, :destroy]
  end

  get "/dashboard", to: "welcome#dashboard"

  put "/articles/:id/publish", to: "articles#publish"
  
end