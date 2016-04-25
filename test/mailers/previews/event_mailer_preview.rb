# Preview all emails at http://localhost:3000/rails/mailers/event_mailer
class EventMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/event_mailer/new_event
  def new_event
    event = Event.last
    EventMailer.new_event(event)
  end

end
