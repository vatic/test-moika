class AddTypeToBanners < ActiveRecord::Migration
  def change
    add_column :banners, :type, :string
    add_index :banners, :type
  end
end
