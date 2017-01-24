Rails.application.routes.draw do

  

  # home/index/root page
  root 'static_pages#index'

  # GET requests
  get '/about' => 'static_pages#about'
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  get 'questions/new' => 'questions#new'
  
  # POST requests
  post '/login' => 'sessions#create'

  resources :questions
  resources :users, :param => :username
  resources :local_surveys, :except => [:new, :create]
  resources :national_surveys, :except => [:new, :create]

  resources :users, :only => [:show], :param => :username do
    resources :local_surveys, :only => [:new, :create]
    resources :national_surveys, :only=> [:new, :create]
  end

end