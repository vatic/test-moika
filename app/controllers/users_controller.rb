class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :update_main_action, :destroy]

  def show
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
