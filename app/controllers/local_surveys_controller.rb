class LocalSurveysController < ApplicationController
  before_action :set_local_survey, only: [:show, :edit, :update, :destroy]

  # GET /local_surveys
  # GET /local_surveys.json
  def index
    @local_surveys = LocalSurvey.all
  end

  # GET /local_surveys/1
  # GET /local_surveys/1.json
  def show
  end

  # GET /local_surveys/new
  def new
    @local_survey = LocalSurvey.new
  end

  # GET /local_surveys/1/edit
  def edit
  end

  # POST /local_surveys
  # POST /local_surveys.json
  def create
    @local_survey = LocalSurvey.new(local_survey_params)

    respond_to do |format|
      if @local_survey.save
        format.html { redirect_to @local_survey, notice: 'Local survey was successfully created.' }
        format.json { render :show, status: :created, location: @local_survey }
      else
        format.html { render :new }
        format.json { render json: @local_survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /local_surveys/1
  # PATCH/PUT /local_surveys/1.json
  def update
    respond_to do |format|
      if @local_survey.update(local_survey_params)
        format.html { redirect_to @local_survey, notice: 'Local survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @local_survey }
      else
        format.html { render :edit }
        format.json { render json: @local_survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /local_surveys/1
  # DELETE /local_surveys/1.json
  def destroy
    @local_survey.destroy
    respond_to do |format|
      format.html { redirect_to local_surveys_url, notice: 'Local survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_local_survey
      @local_survey = LocalSurvey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def local_survey_params
      params.require(:local_survey).permit(:jb_region, :national_jb, :local_jb, :nun_local_events, :num_related, :age_group, :num_jbers, :gender_ratio, :represented, :good_relationship, :awareness_of_meetings, :num_local_attenders, :num_regional_attenders, :num_international_attenders, :participates, :knowGoals, :GQ1, :GQ2, :GQ3, :GQ4, :GQ5, :GQ6, :GQ7, :GQ8, :GQ9, :G2Q1, :G2Q2, :G2Q3, :G2Q4, :G2Q5, :G2Q6, :G3Q1, :G3Q2, :G3Q3, :G3Q4, :G3Q5, :G4Q1, :G4Q2, :G4Q3, :G4Q4, :G4Q5, :G4Q6)
    end
end
