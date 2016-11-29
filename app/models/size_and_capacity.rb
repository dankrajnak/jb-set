class SizeAndCapacity < ApplicationRecord
    belongs_to :user
    validates :num_events, :presence => true
    validates :num_related_area, :presence => true
    validates :age_group, :presence => true
    validates :involved, :presence => true
    validates :gender_info, :presence => true
    validates :user_id, :presence => true
end
