class ChangePersonalMessage < ActiveRecord::Migration
  def change
  	remove_index :personal_messages, :iser_id
  	remove_column :personal_messages, :iser_id

  	add_column :personal_messages, :user_id, :integer, index: true
  end
end
