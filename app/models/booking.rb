class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true

  after_validation :calculate_total_price

  def calculate_total_price
    total_days = end_date - start_date
    self.total_price = total_days * flat.price_per_night
  end
end
