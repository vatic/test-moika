class AddNormalToUser < ActiveRecord::Migration
  def change
    add_column :users, :normal, :boolean, default: true
  end
end
