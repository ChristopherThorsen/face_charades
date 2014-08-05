class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    graph = Koala::Facebook::API.new(session[:access_token])
    user = graph.get_object("me")
    facebook_id = user["id"]
    
    User.find_by(facebook_id: facebook_id)
  end
end
