class QuestionAnswer < ApplicationRecord
  belongs_to :survey_completion
  belongs_to :question
  #validates :answer, presence: true;
end
