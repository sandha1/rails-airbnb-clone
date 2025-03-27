class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def my_flats
    @flats = current_user.flats.order(updated_at: :desc)
  end
end
