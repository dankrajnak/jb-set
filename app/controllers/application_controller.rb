class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user
    unless current_user
      flash[:error] = "Sorry, you need to sign up or login to see that page!"
      redirect_to login_path
    end
  end

  def not_found(message)
    flash[:error] = "#{message}"
    redirect_back :fallback_location => root_path
  end

  def current_user? (user)
    current_user == user
  end

end
