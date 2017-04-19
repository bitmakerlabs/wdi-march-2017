class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true
  # Exercise for student: Add a validation for unique email address
end
