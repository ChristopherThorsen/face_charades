class DashboardsController < ApplicationController
  def show
    @round = Round.new
    @guesses = current_user.guesses
    @pending_guesses = current_user.pending_guesses
    @card = Card.all.sample
    @facebook_friends = users_for_facebook_friends
  end

  private

  def users_for_facebook_friends
    User.where(facebook_id: user_ids_for_facebook_friends)
  end

  def user_ids_for_facebook_friends
    facebook_friends.map { |friend| friend["id"] }
  end

  def facebook_friends
    FacebookUser.new(current_user, session[:access_token]).find_friends
  end
end
