class Round < ActiveRecord::Base
  validates :user_id, presence: true
  validates :card_id, presence: true

  has_many :guesses, dependent: :destroy
  has_many :users, through: :guesses
  has_many :photos, dependent: :destroy

  belongs_to :card
  belongs_to :user
end
