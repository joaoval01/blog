Rails.application.routes.draw do
  root to: "home#index"
  resources :categories
  resources :roles
  resources :posts
  resources :readers
  resources :comments
  devise_for :users, :controllers => { :registrations => "users/registrations" }

  get '/post/:id', to: 'home#post', as: 'home_post'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
