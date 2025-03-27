class User < ApplicationRecord
  has_many :flats, dependent: :destroy
  has_many :bookings, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
