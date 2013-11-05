class AddCarWashIdToBanners < ActiveRecord::Migration
  def change
    add_column :banners, :car_wash_id, :integer
    add_index :banners, :car_wash_id
  end
end
