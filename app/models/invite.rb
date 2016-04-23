class Invite < ActiveRecord::Base
  def self.confirmation
    ['Accepted', 'Rejected', 'Pending']
  end

  belongs_to :user
  belongs_to :event
end
