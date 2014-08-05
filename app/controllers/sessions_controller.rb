class SessionsController < ApplicationController
  def new
    @login_request_to_facebook = Koala::Facebook::OAuth.new(ENV.fetch('FACEBOOK_APP_ID'), ENV.fetch('FACEBOOK_SECRET'), sessions_url).url_for_oauth_code
  end

  def create
    access_token = get_access_token
    user = FacebookUser.new(access_token).find_or_create
    session[:facebook_id] = user.facebook_id

    redirect_to :dashboard
  end

  private

  def get_access_token
    if params[:code]
      Koala::Facebook::OAuth.new(ENV.fetch('FACEBOOK_APP_ID'), ENV.fetch('FACEBOOK_SECRET'), sessions_url).get_access_token(params[:code])
    end
  end
end
