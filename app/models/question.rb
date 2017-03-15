class Question < ApplicationRecord
  belongs_to :survey
  has_many :question_answers, :dependent => :destroy
end
