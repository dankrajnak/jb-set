class StaticPagesController < ApplicationController
  def index
    @answers = QuestionAnswer.all
  end
end
