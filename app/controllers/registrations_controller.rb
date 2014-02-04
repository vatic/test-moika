class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(resource)
    if resource.is_a?(User)
      user_path(resource)
    elsif resource.is_a?(NormalUser)
      normal_user_path(resource)
    else
      super
    end
  end
end
