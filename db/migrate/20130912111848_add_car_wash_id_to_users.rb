class AddCarWashIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :car_washes, index: true
  end
end
