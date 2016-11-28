class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :author_id
      t.integer :receiver_id

      t.timestamps null: false
    end
    add_index :conversations, :author_id
    add_index :conversations, :receiver_id
    add_index :conversations, [:author_id, :receiver_id], unique: true
  end
end
