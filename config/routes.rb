Rails.application.routes.draw do


  root 'static_pages#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  get '/about' => 'static_pages#about'
  

  resources :users, :param => :username
  resources :background_infos, :except => [:new, :create]

  resources :users, :only => [:show], :param => :username do
    resources :background_infos, :only => [:new, :create]
  end
  
end