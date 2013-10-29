class ApplicationController < ActionController::Base
  helper :application
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.is_a?(User) 
      if resource.client?
        edit_car_wash_path(resource.car_wash)
      elsif resource.admin?
        admin_path
      else
        super
      end
    else
      super
    end
  end

  protected
    def check_access
      redirect_to(root_path) and return unless current_user and (current_user.client? or current_user.admin?)
    end

end
