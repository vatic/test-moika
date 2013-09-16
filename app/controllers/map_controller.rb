class MapController < ApplicationController
  layout "main_page"
  def show
    @car_washes = CarWash.all
  end
end
