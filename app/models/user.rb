class User < ApplicationRecord
  has_secure_password

  validates :username, unqiueness: true, on: :create
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 8 }, on: :create
end
