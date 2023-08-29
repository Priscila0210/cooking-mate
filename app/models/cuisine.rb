class Cuisine < ApplicationRecord
  validates :name, presence: true
  has_many :recipes
  has_many :users_cuisines
  has_many :users, through: :users_cuisines
end
