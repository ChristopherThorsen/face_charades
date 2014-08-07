class Round < ActiveRecord::Base
  has_many :guesses, dependent: :destroy
  has_many :users, through: :guesses
  has_many :photos, dependent: :destroy

  belongs_to :card
end
