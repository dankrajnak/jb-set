require "test_helper"

class QuestionAnswerTest < ActiveSupport::TestCase
  def question_answer
    @question||= Question.new
  end

  def test_valid
    assert question_answer.valid?
  end

  def test_factory
    assert build(:question).valid?
  end
end
