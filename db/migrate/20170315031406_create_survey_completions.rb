class CreateSurveyCompletions < ActiveRecord::Migration[5.0]
  def change
    create_table :survey_completions do |t|
      t.references :users
      t.references :surveys

      t.timestamps
    end
  end
end
