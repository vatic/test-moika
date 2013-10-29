class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id, null: false
      t.integer :receiver_id, null: false
      t.string :subject, null: false
      t.text :body
      t.datetime :read_at

      t.timestamps
    end
    add_index :messages, :sender_id
    add_index :messages, :receiver_id
  end
end
