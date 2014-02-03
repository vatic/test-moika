class NormalUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

class NormalUser::ParameterSanitizer < Devise::ParameterSanitizer
  def sign_up
    default_params.permit(:email, :name, :phone, :password, :password_confirmation)
  end
end
