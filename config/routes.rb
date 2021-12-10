Rails.application.routes.draw do
  root to: "home#index"
  resources :categories
  resources :roles
  resources :posts
  resources :readers
  resources :comments
  resources :evaluations
  devise_for :users, :controllers => { :registrations => "users/registrations", :sessions => 'users/sessions' }
  resources :users

  post '/create/user', to: 'users#create', as: 'user_create'
  get '/post/:id', to: 'home#post', as: 'home_post'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
