class Booking < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  validates :date, presence: true
  enum status: { pending: 0, accepted: 1, declined: 2 }
  before_update :reject_other_bookings, if: :will_save_change_to_status?

  private

  def reject_other_bookings
    if accepted?
      other_pending_bookings = Booking.where(recipe_id: recipe_id, status: 'pending')
      other_pending_bookings.update_all(status: 'declined')
    end
  end
end
