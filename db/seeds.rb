# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

truth = [true, false]

def time_floor(time, seconds = 15.minutes)
  Time.at((time.to_f / seconds).floor * seconds).utc
end

#Establish base working data

company = Company.create(name: "SpaceBook")

admin = User.create(admin: true, username: "admin", name: "Justin Herrick", email:"admin@spacebook.com", phone_num: Faker::PhoneNumber.phone_number, profile_pic: Faker::Avatar.image, password:"password", company_id: company.id)

not_admin = User.new(admin: false, username: "not_admin", name: Faker::Name.name, email:"not_admin@spacebook.com", phone_num: Faker::PhoneNumber.phone_number, password:"password")
not_admin.save!

10.times do
  campus = Campus.new(city:Faker::Address.city, state:Faker::Address.state, zip:Faker::Address.zip, name:Faker::Name.name, picture_url: Faker::Avatar.image)
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

amenity_list = [
      "Coffee",
      "Projector",
      "Windows",
      "Internal AC",
      "Speakers",
      "Video camera",
      "Microphone",
      "White board"
      ]

8.times do
  Amenity.create(name: amenity_list.shift)
end

10.times do |n|
  n = n + 1
  RoomAmenity.create(room_id: n, amenity_id: rand(1..Amenity.count))
  RoomAmenity.create(room_id: n, amenity_id: rand(1..Amenity.count))
end
