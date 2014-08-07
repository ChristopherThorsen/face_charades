class RoundsController < ApplicationController
  def show
    round = Round.find(params[:id])
    @photos = round.photos
    @guessers = round.users
    @card = round.card
  end

  def create
    card = Card.find(params[:card_id])
    round = Round.create(
      user_id: current_user.id, 
      card_id: card.id
    )
    redirect_to [:new, round, :photo]
  end
end
