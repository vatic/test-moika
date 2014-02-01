class AddSignalTypeToCarWash < ActiveRecord::Migration
  def change
    add_column :car_washes, :signal_type, :string
  end
end
