class AddCountryToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :country, :int
  end
end
