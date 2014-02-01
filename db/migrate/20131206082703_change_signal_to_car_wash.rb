class ChangeSignalToCarWash < ActiveRecord::Migration
  def change
    change_column :car_washes, :signal, :boolean, :default => true
  end
end
