class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @friends = current_user.friends
  end
end
