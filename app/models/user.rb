class User < ActiveRecord::Base
  has_many :friendships, foreign_key: :friendee_id, dependent: :destroy
  has_many :accepted_friendships, -> { where(accepted: true) }, foreign_key: :friendee_id, class_name: "Friendship", dependent: :destroy
  has_many :friends, through: :accepted_friendships, source: :friender
  has_many :rounds
  has_many :guesses

  validates :name, presence: true
  validates :facebook_id, presence: true

  def friends?(user)
    friends.include?(user)
  end

  def can_friend?(user)
    self != user && !friends_with?(user) && !sent_friend_request_to?(user)
  end

  def friends_with?(user)
    friends.include?(user)
  end

  def sent_friend_request_to?(user)
    Friendship.exists?(friender_id: id, friendee_id: user.id)
  end

  def pending_friend_request_to?(user)
    Friendship.exists?(friender_id: id, friendee_id: user.id, accepted: false)
  end

  def received_friend_request_from?(user)
    Friendship.exists?(friender_id: user.id, friendee_id: id)
  end
end
