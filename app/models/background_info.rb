class BackgroundInfo < ApplicationRecord
    belongs_to :user
    validates :jb_region, :presence => true
    validates :user_id, :presence => true
    validates :local_jb, :presence => true
    validates :national_jb, :presence => true
end
