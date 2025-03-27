class PagesController < ApplicationController

  def my_flats
    @flats = current_user.flats.order(updated_at: :desc)
  end

  def my_bookings
    @bookings = current_user.bookings.order(created_at: :desc)
  end
end
