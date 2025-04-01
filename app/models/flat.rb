class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search,
    against: [:name, :description],
    using: { tsearch: { prefix: true } }

  validates :name, presence: true, uniqueness: true
  validates :price_per_night, presence: true, numericality: { only_integer: true }
end
