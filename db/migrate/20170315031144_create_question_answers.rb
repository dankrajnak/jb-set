class CreateQuestionAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :question_answers do |t|
      t.references :users
      t.references :questions
      t.text :answer

      t.timestamps
    end
  end
end
