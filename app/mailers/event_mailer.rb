class EventMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event_mailer.new_event.subject
  #
  def new_event(event)
    @event = event
    @room = @event.room
    @user = @event.user

    mail to: @user.email, subject: "Test email"
  end
end
