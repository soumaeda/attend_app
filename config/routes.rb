Rails.application.routes.draw do
  devise_for :users
  
  post "finish/new" => "finish#create"
  resources :finish
  get 'users' , to: 'users#index'
  get 'users/:id', to: 'users#show', as: 'user'
  root to: "homes#top"
end
