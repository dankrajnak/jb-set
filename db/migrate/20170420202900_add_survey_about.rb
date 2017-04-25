class AddSurveyAbout < ActiveRecord::Migration[5.0]
  def change
    add_column :surveys, :about, :text
  end
end
