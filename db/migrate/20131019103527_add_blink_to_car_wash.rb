class AddBlinkToCarWash < ActiveRecord::Migration
  def change
    add_column :car_washes, :blink, :boolean, default: false
  end
end
