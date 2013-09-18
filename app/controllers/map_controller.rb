class MapController < ApplicationController
  layout "main_page"
  def show
    @car_washes = CarWash.limit(7)
  end
end
