class FacebookUser
  def initialize(access_token)
    @access_token = access_token
  end

  def find_or_create
    User.where(facebook_id: facebook_id).first_or_create(user_params)
  end

  private

  attr_reader :access_token

  def user_params
    {
      name: name,
      facebook_id: facebook_id
    }
  end

  def graph
    @graph ||= Koala::Facebook::API.new(access_token)
  end

  def facebook_user
    @facebook_user ||= graph.get_object("me")
  end

  def facebook_id
    @facebook_id ||= facebook_user["id"]
  end

  def name
    @name ||= facebook_user["first_name"] + " " + facebook_user["last_name"]
  end
end
