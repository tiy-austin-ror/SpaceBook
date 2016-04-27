# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

truth = [true, false]

def time_floor(time, seconds = 15.minutes)
  Time.at((time.to_f / seconds).floor * seconds).utc
end
#Make Ameneities List

amenities = [
      "Coffee Pots",
      "Projectors",
      "Windows",
      "Air Conditioned",
      "Speakers",
      "Recording Setup",
      "Microphones",
      "White Boards",
    ].each do

    end

amenities.each do |amen|
  Amenity.create(name: amen)
end

#Setting Time Rounder

rounded_time = time_floor(rand(Time.now..5.days.from_now))

#Establishing base team


company = Company.create(name: "SpaceBook")

admin = User.create(admin: true, username: "admin", name: "Justin Herrick", email:"admin@spacebook.com", phone_num: Faker::PhoneNumber.phone_number, profile_pic: Faker::Avatar.image, password:"password", company_id: company.id)

not_admin = User.create(admin: false, username: "not_admin", name: Faker::Name.name, email:"not_admin@spacebook.com", phone_num: Faker::PhoneNumber.phone_number, password:"password", company_id: company.id)

campus = Campus.create(city: "Austin", state: "Texas", zip: "78704", name: "HomeBase", picture_url: Faker::Avatar.image, company_id: company.id)

room = Room.create(name: "Bubble",location: "Front Lobby Couches", capacity: rand(3..5), campus_id: campus.id, picture_url: Faker::Avatar.image, events_count: 0, average_capacity_use: 0)


event = room.events.create(user_id: user.id || 0, start_time: rounded_time, duration: rand(1..12), name: Faker::Company.buzzword + " meeting",
                        description: Faker::Company.bs, agenda: Faker::Company.catch_phrase, private: truth.sample) unless user.nil?

room = Room.create(name: "Nest",location: "Left Side-Room in Hall", capacity: rand(5..12), campus_id: campus.id, picture_url: Faker::Avatar.image, events_count: 0, average_capacity_use: 0)

#Valve

10.times do
  campus =
  campus.save!
end

campus_user = CampusUser.new(user_id: admin.id, campus_id: rand(1..Campus.count))
campus_user.save!

campus_user = CampusUser.new(user_id: not_admin.id, campus_id: 1)
campus_user.save!


30.times do
  user = User.new(admin: false, username: Faker::Internet.user_name, name: Faker::Name.name, email:Faker::Internet.email, phone_num: Faker::PhoneNumber.phone_number, profile_pic: Faker::Avatar.image, password:"password")
  user.save!
  campus_user = CampusUser.new(user_id: user.id, campus_id: rand(1..Campus.count))
  campus_user.save!
end


Campus.all.each do |campus|
  10.times do
    user = User.all.to_a.select{|u| u.campus.id == campus.id}.sample
    room = campus.rooms.new(name:Faker::Name.name,location:Faker::Address.city, capacity: rand(10..30), picture_url: Faker::Avatar.image, events_count:0, average_capacity_use: rand(1..100))
    room.save!
    30.times do
      start = rand(Time.now..1.week.from_now)
      start = time_floor(start)
      event = room.events.new(user_id: user.id || 0, start_time: start, duration: rand(1..12), name: Faker::Company.buzzword,
                              description: Faker::Company.bs, agenda: Faker::Company.catch_phrase, private: truth.sample) unless user.nil?
      event.save unless user.nil?

    end
  end
end

campus = Campus.first
room = campus.rooms.first
past_event = room.events.new(user_id: 2, start_time: Time.new(2016, 4, 20, "+6:00"), duration: 1, name: Faker::Company.buzzword,
                        description: Faker::Company.bs, agenda: Faker::Company.catch_phrase, private: truth.sample)
past_event.save!

10.times do |n|
  n = n + 1
  RoomAmenity.create(room_id: n, amenity_id: rand(1..Amenity.count))
  RoomAmenity.create(room_id: n, amenity_id: rand(1..Amenity.count))
end
