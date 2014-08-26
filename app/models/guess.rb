class Guess < ActiveRecord::Base
  belongs_to :user
  belongs_to :round

  def self.pending
    where(complete: false)
  end

  def mark_complete
    update(complete: true)
  end

  def self.sort_by_time
    order("created_at DESC")
  end

  def self.last_guesses_on_games(user)
    where(round_id: user.round_ids, complete: true).order("created_at DESC").limit(7)
  end

  def find_user
    User.find(self.user_id).name
  end

  def correct_status
    if self.correct
      "C"
    else
      "X"
    end
  end
end
