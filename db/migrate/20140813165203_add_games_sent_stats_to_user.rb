class AddGamesSentStatsToUser < ActiveRecord::Migration
  def change
    add_column :users, :total_games_sent, :integer, null: false, default: 0
    add_column :users, :total_wins_on_games_sent, :integer, null: false, default: 0
  end
end
