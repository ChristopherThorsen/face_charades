class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.belongs_to :user, null: false
      t.belongs_to :round, null: false

      t.timestamps null: false
    end
  end
end
