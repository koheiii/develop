class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  has_many :lives
  has_many :favorites
  has_many :favorite_lives, through: :favorites, source: 'live'

  has_secure_password

end
