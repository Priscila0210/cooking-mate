class Recipe < ApplicationRecord
  belongs_to :cuisine
  belongs_to :user
  validates :name, presence: true
  validates :length, presence: true
  validates :description, presence: true
  validates :level_of_difficulty, presence: true, inclusion: { in: ["easy", "medium", "hard"] }
end
