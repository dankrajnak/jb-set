Rails.application.routes.draw do

  root 'static_pages#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  get '/about' => 'static_pages#about'
  

  resources :users, :except => [:new], :param => :username
  
end