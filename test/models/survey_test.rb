require "test_helper"

class SurveyTest < ActiveSupport::TestCase
  def survey
    @survey ||= Survey.new
  end

  def test_valid
    assert survey.valid?
  end
end
