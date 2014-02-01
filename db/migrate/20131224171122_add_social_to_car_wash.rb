class AddSocialToCarWash < ActiveRecord::Migration
  def change
    add_column :car_washes, :vk_url, :string
    add_column :car_washes, :odn_url, :string
  end
end
