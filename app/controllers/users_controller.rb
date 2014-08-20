class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @round = Round.new
    @card = Card.pick_random_card
  end

  def index
    @friends = current_user.friends
    @round = Round.new
    @card = Card.pick_random_card
  end

  def edit
    @round = Round.new
    @card = Card.pick_random_card
  end

  def update
    current_user.update(user_params)
    redirect_to :dashboard
  end

  private

  def user_params
    params.require(:user).permit(
      :email
    )
  end
end
