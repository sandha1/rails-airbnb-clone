class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @flats = Flat.search(params[:query])
    else
      @flats = Flat.all.order(updated_at: :desc)
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user

    if @flat.save
      redirect_to my_flats_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @flat.update(flat_params)
    redirect_to my_flats_path
  end

  def destroy
    @flat.destroy
    redirect_to my_flats_path, status: :see_other
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :description, :address, :price_per_night, :photo)
  end
end
