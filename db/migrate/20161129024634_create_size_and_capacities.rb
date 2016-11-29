class CreateSizeAndCapacities < ActiveRecord::Migration[5.0]
  def change
    create_table :size_and_capacities do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :num_events
      t.integer :num_related_area
      t.string :age_group
      t.integer :involved
      t.string :gender_info

      t.timestamps
    end
  end
end
