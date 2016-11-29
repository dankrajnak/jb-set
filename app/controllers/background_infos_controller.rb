class BackgroundInfosController < ApplicationController
  before_action :set_background_info, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user

  # GET /background_infos
  # GET /background_infos.json
  def index
    @background_infos = BackgroundInfo.all
  end

  # GET /background_infos/1
  # GET /background_infos/1.json
  def show
  end

  # GET /background_infos/new
  def new
    @background_info = BackgroundInfo.new
    @user = User.find_by_username params[:user_username]
    return not_found("user not found!") if @user.nil?
  end

  # GET /background_infos/1/edit
  def edit
    @background_info = BackgroundInfo.find params[:id]
    @user = current_user
  end

  # POST /background_infos
  # POST /background_infos.json
  def create
    @background_info = BackgroundInfo.new(create_params)

    @user = User.find_by_username params[:user_username]
    return not_found("user not found!") if @user.nil?

    @background_info.user = @user

    if @background_info.save
      flash[:success] = "User information successfully added."
      redirect_to user_path(@user.username)
    else
      render :new
    end
  end

  # PATCH/PUT /background_infos/1
  # PATCH/PUT /background_infos/1.json
  def update
    @background_info = BackgroundInfo.find params[:id]

    if @background_info.update_attributes update_params
      flash[:success] = "Background information successfully updated."
      redirect_to user_path(current_user.username)
    else
      render :edit
    end
  end

  # DELETE /background_infos/1
  # DELETE /background_infos/1.json
  def destroy
    background_info = BackgroundInfo.find params[:id]

    if background_info.destroy
      flash[:success] = "Background information successfully destroyed."
      redirect_to user_path(current_user.username)
    else
      flash[:error] = "Background information was not destroyed."
      redirect_back :fallback_location => edit_user_information_path(background_info)
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_background_info
    @background_info = BackgroundInfo.find(params[:id])
  end

  private
  def create_params
    params.require(:background_info).permit(
      :user_id,
      :jb_region,
      :national_jb,
      :local_jb
    )
  end

  def update_params
    create_params
  end

end
