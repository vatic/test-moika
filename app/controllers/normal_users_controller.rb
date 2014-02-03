class NormalUsersController < ApplicationController
  def show
    @car_washes = CarWash.all
  end
end
