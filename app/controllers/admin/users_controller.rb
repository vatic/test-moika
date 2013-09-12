class Admin::UsersController < ApplicationController
  layout 'admin'

  #before_filter :find_user, :only => [:edit, :update, :show, :destroy]

  def index
    #@users = User.all
    @admins = User.admins
    @clients = User.clients
    @guests = User.guests

    respond_to do |format|
      format.html
      format.json { render json: @users}
    end
  end
end
