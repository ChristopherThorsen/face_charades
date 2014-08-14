class FacebookUser
  def initialize(user, access_token)
    @access_token = access_token
    @user_facebook_id = user.facebook_id
  end

  def find_friends
    graph.get_connections(@user_facebook_id, "friends", api_version: 'v2.0')
  end

  private

  attr_reader :access_token
  
  def graph
    @graph ||= Koala::Facebook::API.new(access_token)
  end
end
