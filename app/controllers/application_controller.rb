class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def get_facebook_info
    graph = Koala::Facebook::API.new(session[:access_token])
    user = graph.get_object("me")
    facebook_id = user["id"]
    name = user["first_name"] + " " + user["last_name"]
    {"name" => name, "facebook_id" => facebook_id}
  end
  def current_user
    facebook_info = get_facebook_info
    facebook_id = facebook_info["facebook_id"]
    User.find_by(facebook_id: facebook_id)
  end
end
