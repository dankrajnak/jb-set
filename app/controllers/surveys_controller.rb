class SurveysController < ApplicationController

  def index
    @surveys = Survey.all
    respond_to do |format|
      format.json
      format.xlsx {
        date = "#{Time.now.day}-#{Time.now.month}"
        response.headers['Content-Disposition'] = "attachment; filename= \"JB SET (#{date}).xlsx\""
      }
    end
  end

  def show
    @survey = Survey.find_by_name(params[:name])
    @lastCompletionTime;
    @lastCompletionCountry;
		
		# List of countres that have completed this survey
		@countries = []
		
    if @survey
			@survey.survey_completions.order(:updated_at).each do |sc|
				unless sc.question_answers.any? {|q| q.question.required && (q.answer.blank? || q.answer == "/No Answer/")}
					@countries.push sc.country
					@lastCompletionTime = sc.updated_at
					@lastCompletionCountry = sc.country
				end
			end
		end
	end
end
