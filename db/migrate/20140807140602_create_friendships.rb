class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.belongs_to :friender, index: true, null: false
      t.belongs_to :friendee, index:true, null: false
      t.boolean :accepted, default: false, null: false

      t.timestamps null: false
    end
    add_index :friendships, [:friender_id, :friendee_id], unique: true, name: "friends"
  end
end
