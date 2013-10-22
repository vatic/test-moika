class MapController < ApplicationController
  layout "main_page"
  def show
    @car_washes = CarWash.limit(7)
    @updated_at = Time.now.utc
  end
end
