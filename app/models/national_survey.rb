class NationalSurvey < ApplicationRecord
    belongs_to :user
    validates :user_id, :jb_region, :jb_neighborhood, :num_chapters, :national_jb, :leadership_composition, :national_events, :num_active, :num_active_national, :gender_ratio, :S3Q5, :S3P2Q3, :S3P2Q4, :S3P2Q5, :S4P1Q2, :S4P4Q4, :S6Q1, :S6Q2, :presence => true
    validates :S3Q1, :S3Q2, :S3Q4, :S3P1Q1, :S3P1Q2, :S3P1Q3, :S3P1Q4, :S3P1Q5, :S3P1Q6, :S3P2Q1, :S3P2Q2, :S4P2Q1, :S4P2Q2, :S4P3Q1, :S4P3Q2, :S4P3Q3, :S4P3Q4, :S4P4Q1, :S4P4Q2, :S4P4Q3, :S5Q1, :S5Q2, inclusion: { in: [ true, false ] }
end
