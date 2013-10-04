class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.integer :car_wash_id, index: true
      t.integer :action_text_id, index: true
      t.integer :action_type_id, index: true

      t.timestamps
    end
  end
end
