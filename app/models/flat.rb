class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericability: { only_integer: true }
end
