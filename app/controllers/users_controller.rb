class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @round = Round.new
    @card = Card.pick_random_card
  end

  def index
    @friends = current_user.friends
  end
end
