class ApplicationController < ActionController::Base
  after_action :allow_iframe
  helper :application
  helper_method :resource, :resource_name, :devise_mapping
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_devise_params, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      if resource.client?
        edit_car_wash_path(resource.car_wash)
      elsif resource.admin?
        admin_path
      else
        super
      end
    elsif resource.is_a?(NormalUser)
      normal_user_path(resource)
    else
      super
    end
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  protected
    def check_access
      redirect_to(root_path) and return unless current_user and (current_user.client? or current_user.admin?)
    end

    def devise_parameter_sanitizer
      if resource_class == User
        User::ParameterSanitizer.new(User, :user, params)
      elsif resource_class == NormalUser
        NormalUser::ParameterSanitizer.new(NormalUser, :normal_user, params)
      else
        super # Use the default one
      end
    end

    def configure_devise_params
      devise_parameter_sanitizer
    end

  private
    def allow_iframe
      response.headers.except! 'X-Frame-Options'
    end
end
