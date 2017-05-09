Rails.application.routes.draw do

  # home/index/root page
  root 'static_pages#index'

  # GET requests
  get '/about' => 'static_pages#about'
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'


  # POST requests
  post '/login' => 'sessions#create'

  resources :users, :param => :username
  resources :survey_completions

  # For JSON
  resources :surveys, :only => [:index, :show], :param => :name
  resources :questions, :only => [:show]

  resources :users, :only => [:show], :param => :username do
    resources :survey_completions, :only => [:new, :create, :delete]
    resources :local_surveys, :only => [:new, :create]
    resources :national_surveys, :only=> [:new, :create]
  end

end