class FlatsController < ApplicationController

  def index
    @flats = Flat.all.order(updated_at: :desc)
  end

  def show
    @flat = Flat.find(params[:id])
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
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)
    redirect_to my_flats_path
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to my_flats_path, status: :see_other
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :description, :address, :price_per_night, :photo)
  end
end
