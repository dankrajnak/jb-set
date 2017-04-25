class SurveysController < ApplicationController

  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
    @lastCompletionTime;
    @lastCompletionCountry;
    @survey.survey_completions.order(updated_at: :desc).any? do |s|
      if s.question_answers.any? {|q|  q.answer.blank? || q.answer == "/No Answer/"}
        false
      else
        @lastCompletionTime = s.updated_at
        @lastCompletionCountry = s.country
        true
      end
    end
  end
end