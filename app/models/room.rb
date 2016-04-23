class Room < ActiveRecord::Base
  validates :name, presence: true
  validates :location, presence: true
  validates :capacity, presence: true
  has_many :room_amenities, dependent: :destroy
  has_many :events, dependent: :destroy
  belongs_to :campus#, counter_cache: true

  def event_array
    all_events = []
    self.events.each do |event|
      start_time = Time.parse(event.start_time)
      end_time = start_time + (event.duration*15).minutes
      all_events << (event.start_time..end_time)
    end
    all_events
  end
end
