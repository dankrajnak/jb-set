class FrontPageController < ApplicationController
  def index
    @answers = QuestionAnswer.all
  end
end
