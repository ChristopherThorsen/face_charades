class AddGuessToGuesses < ActiveRecord::Migration
  def change
    add_column :guesses, :answer, :string
  end
end
