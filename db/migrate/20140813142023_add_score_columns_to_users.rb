class AddScoreColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total_games_received, :integer, null: false, default: 0
    add_column :users, :total_received_games_won, :integer, null: false, default: 0
  end
end
