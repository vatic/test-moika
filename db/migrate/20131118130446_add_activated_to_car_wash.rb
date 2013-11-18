class AddActivatedToCarWash < ActiveRecord::Migration
  def change
    add_column :car_washes, :activated, :boolean, default: false
  end
end
