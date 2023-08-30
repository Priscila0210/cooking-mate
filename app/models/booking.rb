class Booking < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  validates :date, presence: true
end
