class AddVideonedToCarWash < ActiveRecord::Migration
  def change
    add_column :car_washes, :videoned, :boolean, default: false
  end
end
