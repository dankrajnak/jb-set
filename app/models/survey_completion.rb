class SurveyCompletion < ApplicationRecord
  belongs_to :user
  belongs_to :survey
  has_many :question_answers, :dependent => :destroy

  validates :user_id, presence: true
  validates :survey_id, presence: true

end
