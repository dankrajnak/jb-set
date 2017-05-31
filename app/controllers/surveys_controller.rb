class SurveysController < ApplicationController

  def index
    @surveys = Survey.all
    respond_to do |format|
      format.json
      format.xlsx {
        date = "#{Time.now.day}-#{Time.now.month}"
        response.headers['Content-Disposition'] = "attachment; filename= \"JB_SET (#{date}).xlsx\""
      }
    end
  end

  def show
    @survey = Survey.find_by_name(params[:name])
    @lastCompletionTime;
    @lastCompletionCountry;
    if @survey
			@survey.survey_completions.order(updated_at: :desc).any? do |s|
				if s.question_answers.any? {|q| q.question.required && (q.answer.blank? || q.answer == "/No Answer/")}
					false
				else
					@lastCompletionTime = s.updated_at
					@lastCompletionCountry = s.country
					true
				end
			end
		end
  end
end
