class Role < ActiveRecord::Base

  has_and_belongs_to_many :users, join_table: "roles_users"

  def self.admin
    find_or_create_by(name: "admin")
  end

  def self.client
    find_or_create_by(name:"client")
  end

  def self.guest
    find_or_create_by(name:"guest")
  end

  def self.normal_user
    find_or_create_by(name:"normal_user")
  end
end
