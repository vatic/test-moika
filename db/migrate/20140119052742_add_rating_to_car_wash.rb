class AddRatingToCarWash < ActiveRecord::Migration
  def change
    add_column :car_washes, :rating, :integer, default: 0
  end
end
