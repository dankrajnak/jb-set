class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username params[:user][:username]

    if user.nil?
      not_found("There is no account tied to that user. Please enter a valid username and password, or sign up to create an account.")
    elsif user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.first_name}."
      redirect_to user_path(current_user.username)
    else
      flash[:error] = "Please enter a valid username and password."
      redirect_to login_path
    end
  end

  def destroy
    flash[:notice] = "Successfully logged out."
    session[:user_id] = nil
    redirect_to root_path
  end

end
