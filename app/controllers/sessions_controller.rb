class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username params[:user][:username]
    not_found("Not valid username or password") if user.nil?

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in. Welcome, #{user.first_name}."
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
