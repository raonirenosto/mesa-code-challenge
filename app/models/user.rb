class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :password, presence: true,
    allow_nil: true, allow_blank: false
end
