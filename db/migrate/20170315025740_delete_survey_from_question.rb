class DeleteSurveyFromQuestion < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :survey
  end
end
