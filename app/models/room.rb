class Room < ActiveRecord::Base
  validates :name, presence: true
  validates :location, presence: true
  validates :capacity, presence: true
  has_many :room_amenities, dependent: :destroy
  has_many :events, dependent: :destroy
  belongs_to :campus#, counter_cache: true

  def self.search(search)
    if search
      find(:all, :conditions => ['name ILIKE ?', 'location ILIKE ?', 'capacity ILIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end 
end
