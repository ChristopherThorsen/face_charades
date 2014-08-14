class SessionsController < ApplicationController
  def new
    @login_request_to_facebook = Koala::Facebook::OAuth.new(ENV.fetch('FACEBOOK_APP_ID'), ENV.fetch('FACEBOOK_SECRET'), sessions_url).url_for_oauth_code(permissions: "user_friends")
  end

  def create
    access_token = get_access_token
    session[:access_token] = access_token
    user = UserCreator.new(session[:access_token]).find_or_create_from_facebook
    session[:facebook_id] = user.facebook_id
    friends = FacebookUser.new(current_user, session[:access_token]).find_friends
    session[:friends] = friends

    redirect_to :dashboard
  end

  def destroy
    reset_session

    redirect_to root_path
  end

  private

  def get_access_token
    if params[:code]
      Koala::Facebook::OAuth.new(ENV.fetch('FACEBOOK_APP_ID'), ENV.fetch('FACEBOOK_SECRET'), sessions_url).get_access_token(params[:code])
    end
  end
end
