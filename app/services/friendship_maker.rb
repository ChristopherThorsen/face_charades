class FriendshipMaker
  def initialize(friender, friendee)
    @friender = friender
    @friendee = friendee
  end

  def make_friendship
    ActiveRecord::Base.transaction do
      accept_friendship
      create_reverse_friendship
    end
  end

  private

  def current_friendship_request
    @current_friendship_request ||= Friendship.find_by(friender: @friender, friendee: @friendee)
  end

  def accept_friendship
    current_friendship_request.update_attributes(accepted: true)
  end

  def create_reverse_friendship
    Friendship.create(friender: @friendee, friendee: @friender, accepted: true)
  end
end
