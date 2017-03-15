class RemoveReferenceFromSurveyCompletion < ActiveRecord::Migration[5.0]
  def change
    remove_column :survey_completions, :users_id
    remove_column :survey_completions, :surveys_id
    remove_reference :survey_completions, :users_id, index: true
    remove_reference :survey_completions, :surveys_id, index: true
  end
end
