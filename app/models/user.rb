class User < ApplicationRecord
  has_secure_password

  validates :user_name, presence: true
  validates :user_email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }, if: :password_digest_changed?
  
  has_many :items

  def as_json(options = {})
    super(options.merge(except: [:password_digest]))
  end
end
