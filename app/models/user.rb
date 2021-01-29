# This class represents a user in the system
class User < ApplicationRecord
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence:true, uniqueness: true
  has_many :library_items, dependent: :destroy
end