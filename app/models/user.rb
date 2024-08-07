class User < ApplicationRecord
  has_secure_password

  validates :username, uniqueness: true, presence: true, on: :create
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 8 }, on: :create
end
