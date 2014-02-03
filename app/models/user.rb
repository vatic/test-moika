class User < ActiveRecord::Base

  scope :admins, -> { includes(:roles).where("roles.name='admin'").references(:roles) }
  scope :clients, -> { includes(:roles).where("roles.name='client'").references(:roles) }
  scope :guests, -> { includes(:roles).where("roles.name='guest'").references(:roles) }
  scope :normal_users, -> { includes(:roles).where("roles.name='normal_user'").references(:roles) }


  has_and_belongs_to_many :roles, join_table: "roles_users"
  has_many :subscribes
  belongs_to :car_wash
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"
  has_many :received_messages, class_name: "Message", foreign_key: "receiver_id"

  validates_presence_of :email, :phone, :contact_person, :car_wash_title,
    unless: Proc.new { |u| u.normal?}

  validates_presence_of :email, :phone,
    if: Proc.new { |u| u.normal?}


  before_validation do |user|
    logger.debug "vatagin #{user.normal?}"
    if user.normal?
      user.roles << Role.normal_user
    else
      if User.admins.empty?
        user.make_admin
      else
        user.make_guest
      end
    end
  end

  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def role?(role)
    return !!self.roles.find_by(name: role.to_s)
  end

  def self.admins
     includes(:roles).where("roles.name = 'admin'").references(:roles)
  end

  def make_admin
    self.roles << Role.admin
  end

  def revoke_admin
    self.roles.delete(Role.admin)
  end

  def admin?
    role?(:admin)
  end

  def client?
    role?(:client)
  end

  def guest?
    role?(:guest)
  end

  def normal_user?
    role?(:normal_user)
  end

  def make_normal_user
    self.roles << Role.normal_user
  end

  def make_guest
    self.roles << Role.guest
  end

  def revoke_guest
    self.roles.delete(Role.guest)
  end

  def make_client
    self.roles << Role.client
  end

  def revoke_client
    self.roles.delete(Role.client)
  end
end

class User::ParameterSanitizer < Devise::ParameterSanitizer
  def sign_up
    default_params.permit(:phone, :contact_person, :car_wash_title, :email, :password, :password_confirmation, :normal)
  end
end
