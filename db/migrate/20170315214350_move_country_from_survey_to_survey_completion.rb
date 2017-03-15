class MoveCountryFromSurveyToSurveyCompletion < ActiveRecord::Migration[5.0]
  def change
    remove_column :surveys, :country
    add_column :survey_completions, :country, :string
  end
end
