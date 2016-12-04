class NationalSurveysController < ApplicationController
  before_action :set_national_survey, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user

  def index
    @national_surveys = NationalSurvey.all
  end

  def show
  end

  def new
    @national_survey = NationalSurvey.new
    @user = User.find_by_username params[:user_username]
    return not_found("user not found!") if @user.nil?
  end

  def edit
    set_national_survey
    @user = current_user
  end

  def create
    @national_survey = NationalSurvey.new(national_survey_params)
    @user = User.find_by_username params[:user_username]
    return not_found("user not found!") if @user.nil?

    @national_survey.user = @user

    if @national_survey.save
      flash[:success] = "Survey Taken!."
      redirect_to user_path(@user.username)
    else
      render :new
    end
  end

  def update
    @national_survey = NationalSurvey.new(national_survey_params)

    if @national_survey.update_attributes national_survey_params
      flash[:success] = "Updated!"
      redirect_to user_path(current_user.username)
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def set_national_survey
    @national_survey = NationalSurvey.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def national_survey_params
    params.require(:national_survey).permit(:jb_region, :jb_neighborhood, :num_chapters, :national_jb, :leadership_composition, :national_events, :num_active, :num_active_national, :gender_ratio, :S3Q1, :S3Q2, :S3Q3, :S3Q4, :S3Q5, :S3P1Q1, :S3P1Q2, :S3P1Q3, :S3P1Q4, :S3P1Q4, :S3P1Q5, :S3P1Q6, :S3P2Q1, :S3P2Q2, :S3P2Q3, :S3P2Q4, :S3P2Q5, :S4P1Q1, :S4P1Q2, :S4P2Q1, :S4P2Q2, :S4P3Q1, :S4P3Q2, :S4P3Q3, :S4P3Q4, :S4P4Q1, :S4P4Q2, :S4P4Q3, :S4P4Q4, :S5Q1, :S5Q2, :S6Q1, :S6Q2)
  end

end
