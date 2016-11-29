class SizeAndCapacitiesController < ApplicationController
  before_action :set_size_and_capacity, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user

  def index
    @size_and_capacities = SizeAndCapacity.all
  end

  def show
  end

  def new
    @size_and_capacity = SizeAndCapacity.new
    @user = User.find_by_username params[:user_username]
    return not_found("user not found!") if @user.nil?
  end

  def edit
    @size_and_capacity = SizeAndCapacity.find params[:id]
    @user = current_user
  end

  def create
    @size_and_capacity = SizeAndCapacity.new(size_and_capacity_params)
    @user = User.find_by_username params[:user_username]
    return not_found("user not found!") if @user.nil?

    @size_and_capacity.user = @user

    if @size_and_capacity.save
      flash[:success] = " size and capacity information successfully added."
      redirect_to user_path(@user.username)
    else
      render :new
    end
  end

  def update
    @size_and_capacity = SizeAndCapacity.find params[:id]

    if @size_and_capacity.update_attributes update_params
      flash[:success] = "Background information successfully updated."
      redirect_to user_path(current_user.username)
    else
      render :edit
    end
  end

  def destroy
    @size_and_capacity.destroy
    respond_to do |format|
      format.html { redirect_to size_and_capacities_url, notice: 'Size and capacity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_size_and_capacity
    @size_and_capacity = SizeAndCapacity.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def size_and_capacity_params
    params.require(:size_and_capacity).permit(:user_id, :num_events, :num_related_area, :age_group, :involved, :gender_info)
  end

  def update_params
    size_and_capacity_params
  end

end
