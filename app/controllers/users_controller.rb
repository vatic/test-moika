class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :update_main_action, :destroy]

  def new
  end

  def new_car_wash
  end

  def new_normal
  end

  def show
    @car_washes = CarWash.limit(20)
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
