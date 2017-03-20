class Survey < ApplicationRecord
  has_many :questions
  has_many :survey_completions
  default_scope -> { order(created_at: :desc) }

  validates :name, presence: true, :uniqueness => true

end
