class NormalUsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @car_washes = @normal_user.car_washes
  end


  private
    def set_user
      @normal_user = NormalUser.find(params[:id])
    end
end
