class CountryFromUserToSurvey < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :country
    add_column :surveys, :country, :string
  end
end
