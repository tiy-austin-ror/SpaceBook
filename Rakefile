# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

desc "Look for events starting in the next 10 minutes and sends reminders"
task :send_reminders => :environment do
  schedule_window = (10.minutes.from_now..17.minutes.from_now)
  events = Event.where(start_time: schedule_window)

end
