class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :price_per_night, presence: true, numericality: { only_integer: true }
end
