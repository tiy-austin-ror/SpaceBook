# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

truth = [true, false]

def time_floor(time, seconds = 15.minutes)
  Time.at((time.to_f / seconds).floor * seconds).utc
end

ActiveRecord::Base.transaction do # This causes all inserts to happen at one time to speed up the seed file
#################GOOGLE###################
  google = Company.new(name: "Google")
  google.save!

  admin = User.new(admin: true, username: "admin", company_id: google.id, name: "Gogole Admin", email:"jaxom555@gmail.com", phone_num: Faker::PhoneNumber.phone_number, password:"password")
  admin.save!

  not_admin = User.new(admin: false, username: "not_admin", name: "Google NonAdmin", company_id: google.id, email:"spacebook1@mailinator.com", phone_num: Faker::PhoneNumber.phone_number, password:"password")
  not_admin.save!

  4.times do
    campus = Campus.new(company_id: google.id, city:Faker::Address.city, state:Faker::Address.state, zip:Faker::Address.zip, name:Faker::Name.name)
    campus.save!
  end

  campus_user = CampusUser.new(user_id: admin.id, campus_id: google.campuses.first.id)
  campus_user.save!

  campus_user = CampusUser.new(user_id: not_admin.id, campus_id: google.campuses.first.id)
  campus_user.save!

#################VALVE###################

  valve = Company.new(name: "Valve")
  valve.save!

  admin = User.new(admin: true, username: "admin", company_id: valve.id, name: "Valve Admin", email:"vnp229@gmail.com", phone_num: Faker::PhoneNumber.phone_number, password:"password")
  admin.save!

  not_admin = User.new(admin: false, username: "not_admin", name: "Valve NonAdmin", company_id: valve.id, email:"spacebook2@mailinator.com", phone_num: Faker::PhoneNumber.phone_number, password:"password")
  not_admin.save!

  4.times do
    campus = Campus.new(company_id: valve.id, city:Faker::Address.city, state:Faker::Address.state, zip:Faker::Address.zip, name:Faker::Name.name)
    campus.save!
  end

  campus_user = CampusUser.new(user_id: admin.id, campus_id: valve.campuses.first.id)
  campus_user.save!

  campus_user = CampusUser.new(user_id: not_admin.id, campus_id: valve.campuses.first.id)
  campus_user.save!
################################################################

  100.times do
    company = Company.all.sample
    user = User.new(admin: false, company_id: company.id, username: Faker::Internet.user_name, name: Faker::Name.name, email:Faker::Internet.email, phone_num: Faker::PhoneNumber.phone_number, password:"password")
    user.save!
    campus_user = CampusUser.new(user_id: user.id, campus_id: company.campuses.sample.id)
    campus_user.save!
  end


  Campus.all.each do |campus|
    7.times do
      user = User.all.to_a.select{|u| u.campus.id == campus.id}.sample
      room = campus.rooms.new(name:Faker::Name.name,location:Faker::Address.city, capacity: rand(10..30), events_count:0, average_capacity_use: rand(1..100))
      room.save!
      20.times do
        start = rand(Time.now..1.week.from_now)
        start = time_floor(start)
        event = room.events.new(user_id: user.id || 0, start_time: start, duration: rand(1..12), name: Faker::Company.buzzword,
                                description: Faker::Company.bs, agenda: Faker::Company.catch_phrase, private: truth.sample, allow_remote: truth.sample) unless user.nil?
        event.save unless user.nil?
      end
    end
  end

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

  n = 0
  10.times do |n|
    n = n + 1
    RoomAmenity.create(room_id: n, amenity_id: rand(1..Amenity.count))
    RoomAmenity.create(room_id: n, amenity_id: rand(1..Amenity.count))
  end

  User.all.each do |user|
    user.campus.events.each do |event|
      if rand > 0.5 &&
         rand > 0.5
        Invite.create(event: event, user: user)
      end
    end
  end
end
