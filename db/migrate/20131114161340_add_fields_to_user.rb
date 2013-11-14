class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string
    add_column :users, :contact_person, :string
    add_column :users, :car_wash_title, :string
  end
end
