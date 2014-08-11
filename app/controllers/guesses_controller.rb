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

    redirect_to :dashboard
  end

  def update
    guess = Guess.find(params[:id])
    if guessed_correctly?
      guess.correct = true
    end

    guess.mark_complete
    set_flash_message(guess)

    redirect_to :dashboard
  end

  private

  def find_round
    Round.find(params[:round_id])
  end

  def find_guess
    Guess.find(params[:id])
  end

  def guess_params
    params.require(:guess).permit(user_id: [])
  end

  def get_user_answer
    params[:answer]
  end
  
  def guessed_correctly?
    answer = Round.find(params[:round_id]).card.prompt
    answer == params[:answer]
  end

  def set_flash_message(guess)
    if guess.correct?
      flash[:notice] = "Great Job"
    else
      flash[:notice] = "Wrong"
    end
  end
end
