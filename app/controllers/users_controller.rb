class UsersController < ApplicationController
  before_filter :authorize, :except => [:new, :create]

  def index
    @users = User.all
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to signup_path
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :username,
      :first_name,
      :last_name,
      :email,
      :date_of_birth,
      :password,
      :password_confirmation,
      )
  end
end
