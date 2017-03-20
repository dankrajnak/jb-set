Rails.application.routes.draw do


  # home/index/root page
  root 'static_pages#index'

  # GET requests
  get '/about' => 'static_pages#about'
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  get 'survey_completions/new'
  get 'survey_completions/edit'
  get 'survey_completions/destroy'

  # POST requests
  post '/login' => 'sessions#create'

  resources :users, :param => :username
  resources :local_surveys, :except => [:new, :create]
  resources :national_surveys, :except => [:new, :create]
  resources :survey_completions, :except => [:new, :create]

  resources :users, :only => [:show], :param => :username do
    resources :survey_completions, :only => [:new, :create, :delete]
    resources :local_surveys, :only => [:new, :create]
    resources :national_surveys, :only=> [:new, :create]
  end

end