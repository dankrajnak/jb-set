class User < ApplicationRecord
  has_secure_password
  has_one :background_info, :dependent => :destroy
  has_one :size_and_capacity, :dependent => :destroy
  has_one :local_survey, :dependent => :destroy
  has_one :national_survey, :dependent => :destroy

  validates :username, :presence => true
  validates :username, :uniqueness => true
  validates :username, :format => {
    :with => /\A[a-zA-Z0-9_-]+\z/,
    :message => "Username can only have letters, numbers, -, and _"
  }
  validates :username, :exclusion => {
    :in => %w(new edit),
    :message => "%{value} is reserved."
  }
  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :email, :format => {
    :with => /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/,
    :message => "Please enter a vaild email address."
  }
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :date_of_birth, :presence => true
  validates :password, :presence => true, :on => :new
  validates :password_confirmation, :presence => true, :on => :new
end
