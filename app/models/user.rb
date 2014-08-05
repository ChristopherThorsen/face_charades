class User < ActiveRecord::Base
  validates :name, presence: true
  validates :facebook_id, presence: true
end
