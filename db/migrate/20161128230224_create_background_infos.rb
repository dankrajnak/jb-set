class CreateBackgroundInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :background_infos do |t|
      t.belongs_to :user, foreign_key: true
      t.string :jb_region
      t.string :national_jb
      t.string :local_jb

      t.timestamps
    end
  end
end
