class DashboardsController < ApplicationController
  def show
    @user = current_user
    @friends = User.where(facebook_id: friend_ids)
  end

  private

  def friend_ids
    session[:friends].map { |friend| friend["id"] }
  end
end
