# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

desc "Look for events starting in the next 10 minutes and sends reminders"
task :send_reminders => :environment do
  schedule_window = (10.minutes.from_now..17.minutes.from_now)
  events = Event.where(start_time: schedule_window)

  events.each do |event|
    invites = event.attending_users

    invites.each do |invite|
      text_form(invite, event)
    end
  end

end

def text_form(invite, event)
  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']
    # = Placeholders, currently keeping these off for security.
  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.account.messages.create({
    :from => '+17372104484',
    :to => invite.user.phone_num,
    :body => 'You have an event scheduled for ' + (event.formatted_start_time) + '. ' +
              'It is in ' + event.room.name + ' at ' + event.room.location + ' and lasts for ' + (event.formatted_event_duration * 15).to_s + ' minutes.',
  })
end
