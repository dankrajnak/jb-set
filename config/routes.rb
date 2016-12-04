Rails.application.routes.draw do

  resources :national_surveys
  root 'static_pages#index'
  get '/about' => 'static_pages#about'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'

  resources :users, :param => :username
  resources :local_surveys, :except => [:new, :create]
  resources :national_surveys, :except => [:new, :create]

  resources :users, :only => [:show], :param => :username do
    resources :local_surveys, :only => [:new, :create]
    resources :national_surveys, :only=> [:new, :create]  
  end
  
end