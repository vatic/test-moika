class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(resource)
    if resource.is_a?(User)
      user_path(resource)
    end
  end
end
