class User < ApplicationRecord
  has_many :flats
  has_many :bookings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
