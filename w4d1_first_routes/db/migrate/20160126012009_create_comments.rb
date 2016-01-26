class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :contact_id
      t.integer :contact_share_id
      t.integer :commentee_id
      t.integer :commentable_id
      t.string :commentable_type

      t.timestamps
    end

    add_index :comments, [:user_id, :commentable_id]
  end
end
