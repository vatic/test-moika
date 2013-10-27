class AddReadToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :read, :boolean, default: false
  end
end
