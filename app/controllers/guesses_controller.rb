class GuessesController < ApplicationController
  def new
    @round = find_round
    @guess = Guess.new
  end

  def create
    round = find_round
    user_ids = guess_params["user_id"]
    user_ids.each do |user_id|
      Guess.create(round_id: round.id, user_id: user_id.to_i)
    end

    redirect_to round
  end

  private

  def find_round
    Round.find(params[:round_id])
  end

  def guess_params
    params.require(:guess).permit(user_id: [])
  end
end
