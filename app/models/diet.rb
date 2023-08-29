class Diet < ApplicationRecord
  validates :name, presence: true
  has_many :users_diets
  has_many :users, through: :users_diets
  has_many :recipes_diets
  has_many :recipes, through: :recipes_diets
end
