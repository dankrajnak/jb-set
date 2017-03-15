require "test_helper"

class QuestionAnswerTest < ActiveSupport::TestCase
  def question_answer
    @question_answer ||= QuestionAnswer.new
  end

  def test_valid
    assert question_answer.valid?
  end
end
