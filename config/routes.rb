Rails.application.routes.draw do
  devise_for :users
  
  post "start/new" => "start#create"
  post "finish/new" => "finish#create"
  resources :start
  resources :finish
  get 'users' , to: 'users#index'
  get 'users/:id', to: 'users#show', as: 'user'
  root to: "homes#top"
end
