class AddReferenceToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_reference :questions, :surveys, index: true
  end
end
