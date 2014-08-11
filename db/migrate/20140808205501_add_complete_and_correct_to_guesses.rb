class AddCompleteAndCorrectToGuesses < ActiveRecord::Migration
  def change
    add_column :guesses, :correct, :boolean, null: false, default: :false
    add_column :guesses, :complete, :boolean, null: false, default: :false
  end
end
