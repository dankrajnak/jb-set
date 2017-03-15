class FixSurveyCompletionReferences < ActiveRecord::Migration[5.0]
  def change
    remove_reference :survey_completions, :users_id
    remove_reference :survey_completions, :surveys_id
    add_reference :survey_completions, :user, index: true
    add_reference :survey_completions, :survey, index: true
  end
end
