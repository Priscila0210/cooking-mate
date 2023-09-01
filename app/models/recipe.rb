class Recipe < ApplicationRecord
  include PgSearch::Model

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

  pg_search_scope :global_search,
                  against: [ :title, :description ],
                  associated_against: {
                    ingredients: [ :name ],
                    cuisine: [ :name ],
                    diets: [ :name ]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
