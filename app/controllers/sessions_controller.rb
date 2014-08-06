class SessionsController < ApplicationController
  def create
    access_token = set_access_token
    user = FacebookUser.new(access_token).find_or_create
    session[:facebook_id] = user.facebook_id
    session[:name] = user.name

    redirect_to :dashboard
  end

  private

  def set_access_token
    if params[:code]
      Koala::Facebook::OAuth.new(ENV.fetch('FACEBOOK_APP_ID'), ENV.fetch('FACEBOOK_SECRET'), sessions_url).get_access_token(params[:code])
    end
  end
end
