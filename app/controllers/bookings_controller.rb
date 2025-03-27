class BookingsController < ApplicationController

  def create
    @flat = Flat.find(params[:flat_id])

    if @flat.user == current_user
      redirect_to my_flats_path
    else
      @booking = Booking.new(booking_params)
      @booking.flat = @flat
      @booking.user = current_user
      @booking.accepted = nil

      if @booking.save
        redirect_to my_bookings_path
      else
        render "flats/show", status: :unprocessable_entity
      end

    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flat_id, :start_date, :end_date)
  end
end
