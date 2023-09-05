class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :address, :age, :description, :availability, :interested_in, :cooking_level, presence: true
  validates :nickname, length: { minimum: 5 }, uniqueness: true
  validates :age, numericality: { only_integer: true }
  validates :description, length: { minimum: 50 }
  validates :cooking_level, inclusion: {in: ["beginner", "some experience", "advanced"]}
  validates :interested_in, inclusion: {in: ["only friends", "open to anything"]}
  has_many :recipes
  has_one_attached :avatar
  # has_many :received_bookings, model: { :booking }, through: :recipes
  # has_many :chatrooms, through: :bookings
end
