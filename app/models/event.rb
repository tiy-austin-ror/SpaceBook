class Event < ActiveRecord::Base
  has_many :invites
  has_many :comments
  belongs_to :room, counter_cache: true
  belongs_to :user

end
