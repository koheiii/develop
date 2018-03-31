class Live < ApplicationRecord
  has_many :scrapings
  belongs_to :user, optional: true

  has_many :favorites
  has_many :favorite_users, through: :favorites, source:'user'

  end
