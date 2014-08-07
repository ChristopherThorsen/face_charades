class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.belongs_to :user, null: false
      t.belongs_to :card, null: false
      t.timestamps null: false
    end
  end
end
