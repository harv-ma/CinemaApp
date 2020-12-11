class User < ApplicationRecord
  # Validations
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true
  validates :forename, presence: true
  validates :surname, presence: true
  


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :booking, dependent: :destroy
  
end
