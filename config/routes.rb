Rails.application.routes.draw do
  devise_for :users
  root 'pages#welcome'
  get '/about' => 'pages#about'
  get '/portfolio' => 'pages#portfolio'

  resources :posts
end
