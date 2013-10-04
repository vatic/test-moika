class CreateActionTexts < ActiveRecord::Migration
  def change
    create_table :action_texts do |t|
      t.string :text

      t.timestamps
    end
  end
end
