class UsersController < ApplicationController
  before_action :authenticate_user, :except => [:new, :create]

  def index
   @users = User.all
  end

  def show
    @user = User.find_by_username params[:username]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new create_params

    if @user.save
      flash[:success] = "Successfully signed up!"
      redirect_to login_path
    else
      render :new
    end
  end

  def edit
    @user = User.find_by_username params[:username]
  end

  def update
    @user = User.find_by_username params[:username]
    if @user.update_attributes update_params
      flash[:success] = "User successfully updated."
      redirect_to user_path(params[:username])
    else
      render :edit
    end
  end

  def destroy
    user = User.find_by_username params[:username]

    if user.destroy
      flash[:success] = "User successfully destroyed."
      redirect_to root_path
    else
      flash[:error] = "Unable to destroy the user."
      redirect_back :fallback_location => users_path
    end
  end

  private
  def create_params
    params.require(:user).permit(
      :username,
      :first_name,
      :last_name,
      :email,
      :date_of_birth,
      :password,
      :password_confirmation,
      :is_national
    )
  end

  def update_params
    create_params
  end

end
