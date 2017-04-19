class SurveyCompletionsController < ApplicationController
  before_action :authenticate_user

  def new
    @survey_completion = current_user.survey_completions.new survey_id: params[:survey]
    @questions = Survey.find(params[:survey]).questions
    @questions = @questions.sort_by &:qorder
    require 'csv'
    @countryNames = Array.new
    CSV.read("#{Rails.root}/app/assets/images/jb-countries.tsv", {:col_sep => "\t"}).each do |c|
      @countryNames.push(c[1])
    end
    @countryNames.shift 4;
    @countryNames.sort!


  end

  def create
    @survey_completion = current_user.survey_completions.new
    @survey_completion.country = params[:survey_completion][:country]
    @survey_completion.survey = Survey.find(params[:survey_id])
    if @survey_completion.save
      #Save all those questions.
        params[:questionAnswer].each do |question, answer|
          questionAnswer = @survey_completion.question_answers.new
          questionAnswer.question = Question.find(question)
          questionAnswer.answer = answer
          questionAnswer.survey_completion = @survey_completion
          unless questionAnswer.save
            flash["alert-danger"] = "An answer was unable to be saved."
          end
        end

      flash[:success] = "Awesome.  Your answers have been saved.  You can edit them at any time."
      redirect_to user_path(current_user.username)
    else
      flash[:warning] = "Aw shit it didn't save"
    end
  end

  def edit
    @survey_completion = SurveyCompletion.find(params[:id])
    @questionsAnswers = SurveyCompletion.find(params[:id]).question_answers.sort_by {|e| e.question.qorder}
    @questions = SurveyCompletion.find(params[:id]).survey.questions.sort_by{|e| e.qorder}
    @countryNames = Array.new
    CSV.read("#{Rails.root}/app/assets/images/jb-countries.tsv", {:col_sep => "\t"}).each do |c|
      @countryNames.push(c[1])
    end
    @countryNames.shift 4;
    @countryNames.sort!

    unless @survey_completion.user == current_user
      redirect_to user_path(current_user.username)
    end
  end

  def update
    @survey_completion = SurveyCompletion.find(params[:id])
    # a naive hack so that it updates the updated_at column every time
    @survey_completion.update country: "fake country"
    @survey_completion.update country: params[:survey_completion][:country]
    if @survey_completion.valid?
      #Save all those questions.
      @survey_completion.question_answers.each {|q| q.destroy}
      params[:questionAnswer].each do |question, answer|
        questionAnswer = @survey_completion.question_answers.new
        questionAnswer.question = Question.find(question)
        questionAnswer.answer = answer
        questionAnswer.survey_completion = @survey_completion
        unless  questionAnswer.save
          flash["alert-danger"] = "An answer was unable to be saved."
        end
      end

      flash[:success] = "Thanks! Your answers have been saved."
      redirect_to user_path(current_user.username)
    else
      flash["alert-danger"] = "Something went wrong, it didn't save."
    end
  end

  def destroy
    survey_completion = SurveyCompletion.find(params[:survey])
    if survey_completion.user == current_user
      if SurveyCompletion.find(params[:survey]).destroy
        flash[:success] = "Answers successfully deleted"
        redirect_to user_path(current_user.username)
      else
        flash["alert-danger"] = "Something went wrong. Answers not deleted."
        redirect_to user_path(current_user.username)
      end
    else
      flash["alert-danger"] = "You don't have access to that page"
      redirect_to user_path(current_user.username)
    end
  end
end
