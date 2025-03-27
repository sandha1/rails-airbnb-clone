class FlatsController < ApplicationController

  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(params[:flat])
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :description, :address, :price_per_night, :number_of_guests)
  end
end
