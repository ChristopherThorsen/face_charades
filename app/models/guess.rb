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
end
