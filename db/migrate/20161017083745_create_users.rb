class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :roles_mask

      t.timestamps null: false
    end
    add_index :users, [:name, :last_name], unique: true
  end
end
