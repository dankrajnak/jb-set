class Question < ApplicationRecord
  belongs_to :survey
  has_many :question_answers, :dependent => :destroy

  validates :name, presence: true;
  validates :qtype, presence: true;
  validates :qorder, presence: true;
  validates :survey_id, presence: true;
end
