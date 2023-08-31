class Booking < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  validates :date, presence: true
  enum status: { pending: 0, accepted: 1, declined: 2 }
end
