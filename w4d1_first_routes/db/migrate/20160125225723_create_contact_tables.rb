class CreateContactTables < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.integer :user_id

      t.timestamps
    end
    create_table :contact_shares do |t|
      t.string :contact_id
      t.integer :user_id

      t.timestamps
    end
    add_index :contacts, [:user_id, :email], :unique => true
    add_index :contact_shares, [:contact_id, :user_id], :unique => true
  end
end
