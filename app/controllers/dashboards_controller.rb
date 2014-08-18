class DashboardsController < ApplicationController
  def show
    @round = Round.new
    @guesses = current_user.guesses
    @pending_guesses = current_user.pending_guesses.sort_by_time
    @card = Card.pick_random_card
    @leaders = best_guesser_leaderboard
  end

  private

  def best_guesser_leaderboard
    leader_ids = current_user.friend_ids + [current_user.id]
    User.where(id: [leader_ids]).order("total_received_games_won DESC").limit(7)
  end

end
