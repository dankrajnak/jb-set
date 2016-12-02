Rails.application.routes.draw do



  resources :size_and_capacities
  root 'static_pages#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  get '/about' => 'static_pages#about'
  

  resources :users, :param => :username
  resources :background_infos, :except => [:new, :create]
  resources :size_and_capacities, :except => [:new, :create] 
  resources :local_surveys, :except => [:new, :create] 

  resources :users, :only => [:show], :param => :username do
    resources :background_infos, :only => [:new, :create]
    resources :size_and_capacities,:only => [:new, :create]
    resources :local_surveys, :only => [:new, :create]  
  end
  
end