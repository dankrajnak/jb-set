require "test_helper"

class SurveyCompletionTest < ActiveSupport::TestCase
  def survey_completion
    @user1 = create(:user)
    @survey1 = create(:survey)
    @survey_completion ||= SurveyCompletion.new user_id: @user1.id, survey_id: @survey1.id
  end

  def test_valid
    assert survey_completion.valid?
  end

  def test_factory
    assert build(:survey_completion).valid?
  end
end
