class ChangeRequest < ActiveRecord::Migration
  def change
    change_table :requests do |t|
        t.change :text, :text
    end
  end
end
