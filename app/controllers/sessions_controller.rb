class SessionsController < ApplicationController
  def create
    if params[:code]
      session[:access_token] = Koala::Facebook::OAuth.new(ENV.fetch('FACEBOOK_APP_ID'), ENV.fetch('FACEBOOK_SECRET'), sessions_url).get_access_token(params[:code]) 
    end

    redirect_to session[:access_token] ? users_path : root_path

  end

  def new

  end
end
