require "test_helper"

class SurveyCompletionTest < ActiveSupport::TestCase
  def survey_completion
    @survey_completion ||= SurveyCompletion.new
  end

  def test_valid
    assert survey_completion.valid?
  end
end
