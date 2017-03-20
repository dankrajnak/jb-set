class UsersController < ApplicationController
  before_action :authenticate_user, :except => [:new, :create]
  before_action :correct_user, :except => [:new, :create]

  def show
    @user = User.find_by_username(params[:username])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new create_params

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "This is your profile!  Click on survey below to take it."
      redirect_to user_path(current_user.username)
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
      flash[:success] = "Your profile information was successfully updated."
      redirect_to user_path(@user.username)
    else
      render :edit
    end
  end

  def destroy
    user = User.find_by_username params[:username]

    if user.destroy
      flash[:success] = "Your account was successfully deleted."
      redirect_to root_path
    else
      flash[:error] = "We were unable to delete your account at this time."
      redirect_back :fallback_location => users_path(@user.username)
    end
  end

  private
    def create_params
      params.require(:user).permit(
        :username,
        :first_name,
        :last_name,
        :email,
        :password,
        :password_confirmation,
        :position
      )
    end

    def update_params
      params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :password,
        :password_confirmation,
        :position
      )
    end

    def correct_user
      @user = User.find_by_username(params[:username])
      redirect_to root_url unless current_user? @user

    end

end
