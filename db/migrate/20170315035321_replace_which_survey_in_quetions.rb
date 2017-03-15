class ReplaceWhichSurveyInQuetions < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :whichsurvey
    add_foreign_key :questions, :survey
  end
end
