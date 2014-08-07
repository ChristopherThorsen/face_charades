class AcceptedFriendshipsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    FriendshipMaker.new(user, current_user).make_friendship
    redirect_to :dashboard
  end
end
