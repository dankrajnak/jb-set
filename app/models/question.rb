class Question < ApplicationRecord
  belongs_to :survey
  has_many :question_answers, :dependent => :destroy

  validates :name, presence: true;
  validates :qtype, presence: true;
  validates :qorder, uniqueness: true;
  validates :survey_id, presence: true;
end
