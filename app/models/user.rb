class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password

  validates :password, length: { minimum: 6 }, allow_nil: true
end
  