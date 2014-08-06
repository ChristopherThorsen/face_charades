class FacebookUser
  def initialize(access_token)
    graph = get_facebook_graph(access_token)
    user = get_user_from_graph(graph)
    @facebook_id = get_facebook_id_from_user(user)
    @name = get_facebook_name_from_user(user)
  end

  def find_or_create
    User.where(facebook_id: @facebook_id).first_or_create(user_params)
  end

  def user_params
    {
      name: @name,
      facebook_id: @facebook_id
    }
  end

  def get_facebook_graph(access_token)
    @graph ||= Koala::Facebook::API.new(access_token)
  end

  def get_user_from_graph(graph)
    @facebook_user ||= graph.get_object("me")
  end

  def get_facebook_id_from_user(user)
    @facebook_id ||= user["id"]
  end

  def get_facebook_name_from_user(user)
    @name ||= user["first_name"] + " " + user["last_name"]
  end
end
