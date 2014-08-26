class DashboardsController < ApplicationController
  def show
    @round = Round.new
    @guesses = current_user.guesses
    @pending_guesses = current_user.pending_guesses.sort_by_time
    @card = Card.pick_random_card
    @best_guessers = best_guesser_leaderboard
    @best_senders = best_sender_leaderboard
    @last_guesses_on_games = Guess.last_guesses_on_games(current_user)
  end

  private

  def best_guesser_leaderboard
    leader_ids = current_user.friend_ids + [current_user.id]
    User.where(id: [leader_ids]).order("total_received_games_won DESC").limit(7)
  end

  def best_sender_leaderboard
    leader_ids = current_user.friend_ids + [current_user.id]
    User.where(id: [leader_ids]).order("total_wins_on_games_sent DESC").limit(7)
  end
end
