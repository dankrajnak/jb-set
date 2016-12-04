class CreateNationalSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :national_surveys do |t|
      t.belongs_to :user, foreign_key: true
      t.string :jb_region
      t.string :jb_neighborhood
      t.integer :num_chapters
      t.string :national_jb
      t.string :leadership_composition
      t.integer :national_events
      t.integer :num_active
      t.integer :num_active_national
      t.string :gender_ratio
      t.boolean :S3Q1
      t.boolean :S3Q2
      t.integer :S3Q3
      t.boolean :S3Q4
      t.integer :S3Q5
      t.boolean :S3P1Q1
      t.boolean :S3P1Q2
      t.boolean :S3P1Q3
      t.boolean :S3P1Q4
      t.boolean :S3P1Q4
      t.boolean :S3P1Q5
      t.boolean :S3P1Q6
      t.boolean :S3P2Q1
      t.boolean :S3P2Q2
      t.integer :S3P2Q3
      t.string :S3P2Q4
      t.string :S3P2Q5
      t.boolean :S4P1Q1
      t.string :S4P1Q2
      t.boolean :S4P2Q1
      t.boolean :S4P2Q2
      t.boolean :S4P3Q1
      t.boolean :S4P3Q2
      t.boolean :S4P3Q3
      t.boolean :S4P3Q4
      t.boolean :S4P4Q1
      t.boolean :S4P4Q2
      t.boolean :S4P4Q3
      t.string :S4P4Q4
      t.boolean :S5Q1
      t.boolean :S5Q2
      t.string :S6Q1
      t.string :S6Q2

      t.timestamps
    end
  end
end
