class RoundsController < ApplicationController
  def show
    round = Round.find(params[:id])
    @photos = round.photos
    @guessers = round.users
    @hidden_answer = make_hidden_answer(round.card.prompt)
  end

  def create
    card = Card.find(params[:card_id])
    round = Round.create(
      user_id: current_user.id, 
      card_id: card.id
    )
    redirect_to [:new, round, :photo]
  end

  private

  def make_hidden_answer(prompt)
    number_of_letters = prompt.length
    "_ " * number_of_letters
  end
end
