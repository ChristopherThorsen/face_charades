class DashboardsController < ApplicationController
  def show
    @round = Round.new
    @guesses = current_user.guesses
    @pending_guesses = current_user.pending_guesses.sort_by_time
    @card = Card.pick_random_card
  end

end
