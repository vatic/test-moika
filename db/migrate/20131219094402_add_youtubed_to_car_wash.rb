class AddYoutubedToCarWash < ActiveRecord::Migration
  def change
    add_column :car_washes, :youtubed, :boolean, default: false
  end
end
