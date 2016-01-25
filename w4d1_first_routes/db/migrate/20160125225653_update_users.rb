class UpdateUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    remove_column :users, :name, :email
    add_index :users, :username, :unique => true
  end
end
