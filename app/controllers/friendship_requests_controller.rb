class FriendshipRequestsController < ApplicationController
  def create
    friendee = User.find(params[:user_id])
    Friendship.create(friender_id: current_user.id, friendee_id: friendee.id)
    redirect_to :dashboard
  end
end
