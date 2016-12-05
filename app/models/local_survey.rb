class LocalSurvey < ApplicationRecord
    belongs_to :user
    validates :user_id, :jb_region, :national_jb, :local_jb, :nun_local_events, :num_related, :age_group, :num_jbers, :gender_ratio, :num_local_attenders, :num_regional_attenders, :num_international_attenders, :G4Q5, :G4Q6, :presence => true
    validates :represented, :good_relationship, :awareness_of_meetings, :participates, :knowGoals, :GQ1, :GQ2, :GQ3, :GQ4, :GQ5, :GQ6, :GQ7, :GQ8, :GQ9, :G2Q1, :G2Q2, :G2Q3, :G2Q4, :G2Q5, :G2Q6, :G3Q1, :G3Q2, :G3Q3, :G3Q4, :G3Q5, :G4Q1, :G4Q2, :G4Q3, :G4Q4, inclusion: { in: [ true, false ] }
end
