class User < ActiveRecord::Base

  before_create do |user|
    if User.admins.empty?
      user.make_admin
    else
      user.make_guest
    end
  end

  scope :admins, includes(:roles).where("roles.name='admin'").references(:roles)
  scope :clients, includes(:roles).where("roles.name='client'").references(:roles)
  scope :guests, includes(:roles).where("roles.name='guest'").references(:roles)


  has_and_belongs_to_many :roles, join_table: "roles_users"
  belongs_to :car_wash

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
