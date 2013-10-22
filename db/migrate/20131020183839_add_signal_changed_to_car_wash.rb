class AddSignalChangedToCarWash < ActiveRecord::Migration
  def change
    add_column :car_washes, :signal_changed, :boolean
  end
end
