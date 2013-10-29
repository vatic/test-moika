class AddCarWashIdToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :car_wash_id, :integer
    add_index :messages, :car_wash_id
  end
end
