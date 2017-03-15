class FixReferencesInvolvingQuestionsAndAnswers < ActiveRecord::Migration[5.0]
  def change
    #Fix Question references
    remove_reference :questions, :surveys, index: true
    remove_column :questions, :surveys_id
    add_reference :questions, :survey, index: true

    #Question Answer changes
    remove_reference :question_answers, :users, index: true
    remove_column :question_answers, :users_id
    add_reference :question_answers, :user, index: true

    remove_reference :question_answers, :questions, index: true
    remove_column :question_answers, :questions_id
    add_reference :question_answers, :question, index: true

  end
end
