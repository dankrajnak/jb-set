class AddReferenceQaToSurveyCompletion < ActiveRecord::Migration[5.0]
  def change
    add_reference :question_answers, :surveycompletion, index: true;
  end
end
