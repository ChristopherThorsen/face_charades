class RoundsController < ApplicationController
  def show
    @round = Round.find(params[:id])
    @photos = @round.photos
    @guessers = @round.users
    @hidden_answer = @round.card.hidden_answer
    @prompt = @round.card.prompt
    @letterbank = Letterbank.new(@round.card.prompt).generate
    @guess = Guess.find_by(user_id: current_user.id, round_id: @round.id)
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
