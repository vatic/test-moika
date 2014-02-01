class PaymentsController < ApplicationController
  def index
    @car_wash = CarWash.find(params[:car_wash_id])
  end
end
