class Admin::UsersController < AdminController

  before_filter :find_user, :only => [:edit, :update, :show, :destroy ,:add_car_wash]

  def index
    #@users = User.all
    @admins = User.admins
    @clients = User.clients
    @guests = User.guests

    logger.debug ( "#{@clients}" )

        respond_to do |format|
          format.html
          format.json { render json: @users}
        end
  end

  def show
  end

  def edit
  end

  def add_car_wash
  end

  def update
    if @user.update_attributes(user_params) && @user.make_client && @user.revoke_guest
      redirect_to admin_users_path, :notice => "User successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, :notice => "User deleted."
  end

  protected

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :salt, :encrypted_password, :car_wash_id)
  end

end
