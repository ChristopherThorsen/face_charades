class Guess < ActiveRecord::Base
  belongs_to :user
  belongs_to :round

end
