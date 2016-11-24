class User < ApplicationRecord
  has_secure_password
  validates :username, :presence => true
  validates :username, :uniqueness => true
  validates :username, :format => {
    :with => /\A[a-zA-Z0-9_-]+\z/,
    :message => "only allows letters, numbers, -, and _"
  }
  validates :username, :exclusion => {
    :in => %w(new edit),
    :message => "%{value} is reserved."
  }
  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :date_of_birth, :presence => true
  validates :password, presence: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
end
