class CreateLocalSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :local_surveys do |t|
      t.belongs_to :user, foreign_key: true
      t.string :jb_region
      t.string :national_jb
      t.string :local_jb
      t.integer :nun_local_events
      t.integer :num_related
      t.integer :age_group
      t.integer :num_jbers
      t.string :gender_ratio
      t.boolean :represented
      t.boolean :good_relationship
      t.boolean :awareness_of_meetings
      t.integer :num_local_attenders
      t.integer :num_regional_attenders
      t.integer :num_international_attenders
      t.boolean :participates
      t.boolean :knowGoals
      t.boolean :GQ1
      t.boolean :GQ2
      t.boolean :GQ3
      t.boolean :GQ4
      t.boolean :GQ5
      t.boolean :GQ6
      t.boolean :GQ7
      t.boolean :GQ8
      t.boolean :GQ9
      t.boolean :G2Q1
      t.boolean :G2Q2
      t.boolean :G2Q3
      t.boolean :G2Q4
      t.boolean :G2Q5
      t.boolean :G2Q6
      t.boolean :G3Q1
      t.boolean :G3Q2
      t.boolean :G3Q3
      t.boolean :G3Q4
      t.boolean :G3Q5
      t.boolean :G4Q1
      t.boolean :G4Q2
      t.boolean :G4Q3
      t.boolean :G4Q4
      t.string :G4Q5
      t.string :G4Q6

      t.timestamps
    end
  end
end
