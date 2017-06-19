class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
		#Keys are used to identify a survey_completion if there are many from the same country
		@keys = Array.new 
		#Keys have a negative qorder.
		@question.survey.questions.each do |q|
			@keys.push q if q.qorder < 0
		end
		
  end
end
