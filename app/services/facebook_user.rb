class FacebookUser

  def initialize(access_token)
    graph = Koala::Facebook::API.new(access_token)
    user = graph.get_object("me")
    @facebook_id = user["id"]
    @name = user["first_name"] + " " + user["last_name"]
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
end
