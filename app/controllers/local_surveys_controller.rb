class LocalSurveysController < ApplicationController
  before_action :set_local_survey, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user

  def index
    @local_surveys = LocalSurvey.all
  end

  def new
    @local_survey = LocalSurvey.new
    @user = User.find_by_username params[:user_username]
    return not_found("User not found!") if @user.nil?
  end

  def edit
    @local_survey = LocalSurvey.find params[:id]
    @user = current_user
  end

  def create
    @local_survey = LocalSurvey.new(local_survey_params)
    @user = User.find_by_username params[:user_username]
    return not_found("User not found!") if @user.nil?

    @local_survey.user = @user

    if @local_survey.save
      flash[:success] = "Your survey answers have been recorded. Thank you!"
      redirect_to user_path(@user.username)
    else
      render :new
    end
  end

  def update
    @user = current_user
    @local_survey = @user.local_survey

    if @local_survey.update_attributes local_survey_params
      flash[:success] = "Your survey answers have been updated."
      redirect_to user_path(current_user.username)
    else
      render :edit
    end
  end

  def destroy
  end

  private
    def set_local_survey
      @local_survey = LocalSurvey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def local_survey_params
      params.require(:local_survey).permit(:jb_region, :national_jb, :local_jb, :nun_local_events, :num_related, :age_group, :num_jbers, :gender_ratio, :represented, :good_relationship, :awareness_of_meetings, :num_local_attenders, :num_regional_attenders, :num_international_attenders, :participates, :knowGoals, :GQ1, :GQ2, :GQ3, :GQ4, :GQ5, :GQ6, :GQ7, :GQ8, :GQ9, :G2Q1, :G2Q2, :G2Q3, :G2Q4, :G2Q5, :G2Q6, :G3Q1, :G3Q2, :G3Q3, :G3Q4, :G3Q5, :G4Q1, :G4Q2, :G4Q3, :G4Q4, :G4Q5, :G4Q6)
    end

end
