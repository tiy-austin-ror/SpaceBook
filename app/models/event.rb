class Event < ActiveRecord::Base
  has_many :invites
  has_many :comments
  belongs_to :room, counter_cache: true
  belongs_to :user


  def formatted_start_time
    self.start_time
  end

  def formatted_event_duration
    self.duration
  end

  def campus
    self.room.campus
  end

  def is_private?
    self.private
  end

  def invite_type
    return "Open" if open_invite == true
    return "Closed"
  end
end
