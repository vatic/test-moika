class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :static_pages do |t|
      t.string :title
      t.text :header
      t.text :content
      t.string :permalink

      t.timestamps
    end
  end
end
