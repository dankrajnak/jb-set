require "test_helper"

class QuestionAnswerTest < ActiveSupport::TestCase
  def question_answer
    @question = create(:question)
    @surveycompletion = create(:survey_completion)
    @question_answer ||= QuestionAnswer.new question_id: @question.id, survey_completion_id: @surveycompletion.id,
                                            answer: "Answer"
  end

  def test_valid
    assert question_answer.valid?
  end
end
