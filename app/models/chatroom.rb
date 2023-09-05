class Chatroom < ApplicationRecord
  belongs_to :booking
  has_many :messages

  def recipient_name(current_user)
    if booking.user == current_user
      booking.recipe.user.nickname
    else
      booking.user.nickname
    end
  end
end
