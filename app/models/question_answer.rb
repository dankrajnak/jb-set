class QuestionAnswer < ApplicationRecord
  belongs_to :survey_completion
  belongs_to :question
  validates :answer, numericality: true, if: Proc.new {|a| a.question.qtype == "n" && !a.answer.blank?}
  validates :survey_completion_id, presence: true
  validates :question_id, presence: true

end
