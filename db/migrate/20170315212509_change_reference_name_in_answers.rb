class ChangeReferenceNameInAnswers < ActiveRecord::Migration[5.0]
  def change
    remove_reference :question_answers, :surveycompletion, index: true
    remove_column :question_answers, :surveycompletion_id
    add_reference :question_answers, :survey_completion, index: true
  end
end
