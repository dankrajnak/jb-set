require "test_helper"

class SurveyCompletionsControllerTest < ActionDispatch::IntegrationTest
  def test_new
    get survey_completions_new_url
    assert_response :success
  end

  def test_edit
    get survey_completions_edit_url
    assert_response :success
  end

  def test_destroy
    get survey_completions_destroy_url
    assert_response :success
  end

end
