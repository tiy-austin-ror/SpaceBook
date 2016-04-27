class Room < ActiveRecord::Base
  validates :name, presence: true
  validates :location, presence: true
  validates :capacity, presence: true
  has_many :room_amenities, dependent: :destroy
  has_many :amenities, through: :room_amenities
  has_many :events, dependent: :destroy
  belongs_to :campus#, counter_cache: true

  attachment :profile_image #required for Refile (image upload)
  

  def self.search(search)
    if search
      find(:all, :conditions => ['name ILIKE ?', 'location ILIKE ?', 'capacity ILIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

  def event_array(new_event = nil)
    all_events = []
    self.events.each do |event|
      if new_event && new_event.id == event.id
        event = new_event
      end
      end_time = event.start_time + (event.duration*15).minutes
      all_events << (event.start_time..end_time) unless event.created_at.nil?
    end

    if new_event && !new_event.created_at
      end_time = new_event.start_time + (new_event.duration*15).minutes
      all_events << (new_event.start_time..end_time)
    end

    all_events.sort_by{|range| range.min.to_i}
  end

  def get_event_overlap(new_event = nil)
    event_ranges = event_array(new_event)
    event_ranges.each_with_index do |event_range,index|
      if (index+1 < event_ranges.count) && (event_range.max > event_ranges[index+1].min)
        return "#{event_range} overlaps with #{event_ranges[index+1]}"
      end
    end
    return false
  end

  def event_overlap?(new_event=nil)
    !!get_event_overlap(new_event)
  end
end
