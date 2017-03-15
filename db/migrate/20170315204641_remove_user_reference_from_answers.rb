class RemoveUserReferenceFromAnswers < ActiveRecord::Migration[5.0]
  def change
    remove_reference :question_answers, :user, index: true
    remove_column :question_answers, :user_id
  end
end
