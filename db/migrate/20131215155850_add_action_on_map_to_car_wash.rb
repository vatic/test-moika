class AddActionOnMapToCarWash < ActiveRecord::Migration
  def change
    add_column :car_washes, :action_on_map, :boolean, default: false
  end
end
