class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :file
      t.string :filename
      t.string :place
      t.string :text

      t.timestamps
    end
  end
end
