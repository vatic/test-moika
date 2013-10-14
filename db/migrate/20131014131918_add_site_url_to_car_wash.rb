class AddSiteUrlToCarWash < ActiveRecord::Migration
  def change
    add_column :car_washes, :site_url, :string
  end
end
