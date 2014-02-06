class CreateNormalUserMessages < ActiveRecord::Migration
  def change
    create_table :normal_user_messages do |t|
      t.integer :sender_id, index: true
      t.integer :receiver_id, index: true
      t.integer :car_wash_id, index: true
      t.string :subject
      t.text :body
      t.datetime :read_at
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
