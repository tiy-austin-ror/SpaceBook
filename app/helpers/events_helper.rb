module EventsHelper
  def time_array
    [['15 minutes', 1],   ['30 minutes', 2],
     ['45 minutes', 3],   ['1 hour',4],
     ['1 hr 15 min',5],   ['1 hr 30 min', 6],
     ['1 hr 45 min',7],   ['2 hours',8],
     ['2 hr 15 min',9],   ['2 hr 30 min', 10],
     ['2 hr 45 min',11],  ['3 hours',12],
     ['3 hr 15 min',13],  ['3 hr 30 min', 14],
     ['3 hr 45 min',15],  ['4 hours',16],
     ['4 hr 15 min',17],  ['4 hr 30 min', 18],
     ['4 hr 45 min',19],  ['5 hours',20],
     ['5 hr 15 min',21],  ['5 hr 30 min', 22],
     ['5 hr 45 min',23],  ['6 hours',24]
   ]
  end

  def get_join_buttons
     output = ""
     if current_user && !@event.private && current_user.invites.where(event_id: @event.id).where("status ILIKE ?", 'Accepted%').count.zero?
      invite_method = current_user.invites.where(event_id: @event.id).count.zero? ? :POST : :PUT
      base_url = "/invites"
      base_url = "/invites/#{current_user.invites.where(event_id: @event.id).first.id}" if invite_method == :PUT
      output << link_to "Join Event", "#{base_url}?invite[status]=Accepted&invite[event_id]=#{@event.id}", method: invite_method, class: "btn btn-default"
      output << link_to "Join Event [remote]", "#{base_url}?invite[status]=Accepted[remote]&invite[event_id]=#{@event.id}", method: invite_method, class: "btn btn-default"
     elsif current_user && current_user.invites.where(event_id: @event.id).where("status ILIKE ?", 'Accepted%').count != 0
      base_url = "/invites/#{current_user.invites.where(event_id: @event.id).first.id}"
      output << link_to "Leave Event", "#{base_url}?invite[status]=Declinded", method: :PUT, class: "btn btn-default"
     end

     output
  end

  def user_can_invite?
    current_user == @event.user || (@event.open_invite && current_user.invites.where(event_id: @event.id).where("status ILIKE ?", 'Accepted%').count != 0)
  end
end
