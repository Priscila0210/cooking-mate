class Recipe < ApplicationRecord
  belongs_to :cuisine
  belongs_to :user
  validates :title, presence: true
  # validates :length, presence: true
  validates :description, presence: true
  validates :level_of_difficulty, presence: true, inclusion: { in: ["easy", "medium", "hard"] }
  has_many :recipes_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipes_ingredients
  accepts_nested_attributes_for :recipes_ingredients
  has_many :recipes_diets, dependent: :destroy
  has_many :diets, through: :recipes_diets
  accepts_nested_attributes_for :recipes_diets
end
