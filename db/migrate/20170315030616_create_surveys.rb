class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.string :name
      t.boolean :national
      t.boolean :local

      t.timestamps
    end
  end
end
