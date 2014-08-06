class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false, default: ""
      t.string :facebook_id, null: false

      t.timestamps null:false
    end
  end
end
