# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

### Establishing Shared Uses ####
truth = [true, false]

def time_floor(time, seconds = 15.minutes)
  Time.at((time.to_f / seconds).floor * seconds).utc
end
start = time_floor(rand(Time.now..1.week.from_now))

["Coffee", "Projector", "Windows", "Internal AC", "Speakers", "Recording Equipment", "Microphone", "White board"].each do |amen|
  Amenity.create(name: amen)
end

ActiveRecord::Base.transaction do # This causes all inserts to happen at one time to speed up the seed file

  #################IRON YARD###################

    iy = Company.create(name: "The Iron Yard")

    kamp = Campus.create(company_id: iy.id, city: "Austin", state:"Texas", zip: "78704", name: "The K Building")
    Room.create(name: "The Kitchen",location: "End of the main hall", capacity: 10, campus_id: kamp.id)
    Room.create(name: "The Bubble",location: "Left door in the hall", capacity: 8, campus_id: kamp.id)
    Room.create(name: "Staff Room",location: "First right in the hall", capacity: 30, campus_id: kamp.id)
    Room.create(name: "The Sun Room",location: "Entrance Lobby", capacity: 6, campus_id: kamp.id)
    Room.create(name: "The Class Room",location: "Second right in the hall", capacity: 25, campus_id: kamp.id)

    camp = Campus.create(company_id: iy.id, city: "Austin", state:"Texas", zip: "78704", name: "The C Building")
    Room.create(name: "The Kitchen",location: "Rear of the primary space", capacity: 12, campus_id: camp.id)
    Room.create(name: "The Design Room",location: "Through the door on rear wall of primary space", capacity: 18, campus_id: camp.id)
    Room.create(name: "The Lobby",location: "Main entrance area, before The Iron Yard suite", capacity: 40, campus_id: camp.id)
    Room.create(name: "The Rear Lobby",location: "Rear of main entrance, near Ping Pong table", capacity: 45, campus_id: camp.id)
    Room.create(name: "The Atrium",location: "Main building courtyard, through main entrance", capacity: 15, campus_id: camp.id)
    Room.create(name: "The Lounge",location: "Through sliding door, left wall of primary space", capacity: 12, campus_id: camp.id)
    Room.create(name: "The Fishbowl",location: "Primary space of The Iron Yard suite", capacity: 50, campus_id: camp.id)

    admin = User.create(admin: true, username: "karlyBear", company_id: iy.id, name: "Karly Borden", email:"admin@ironyard.com", phone_num: Faker::PhoneNumber.phone_number, password:"password")
    CampusUser.create(user_id: admin.id, campus_id: camp.id)


    user = User.create(admin: false, company_id: iy.id, username: "nutellaBoy", name: "Aaron Larner", email: "aaron@ironyard.com", phone_num: Faker::PhoneNumber.phone_number, password:"password")
    CampusUser.create(user_id: user.id, campus_id: camp.id)
    user = User.create(admin: false, company_id: iy.id, username: "frisbeeLady", name: "Abby Larner", email: "abby@ironyard.com", phone_num: Faker::PhoneNumber.phone_number, password:"password")
    CampusUser.create(user_id: user.id, campus_id: camp.id)
    user = User.create(admin: false, company_id: iy.id, username: "yogaGal", name: "Jess Scheuring", email: "jess@ironyard.com", phone_num: Faker::PhoneNumber.phone_number, password:"password")
    CampusUser.create(user_id: user.id, campus_id: camp.id)
    user = User.create(admin: false, company_id: iy.id, username: "rubyDude", name: "Justin Herrick", email: "justin@ironyard.com", phone_num: Faker::PhoneNumber.phone_number, password:"password")
    CampusUser.create(user_id: user.id, campus_id: kamp.id)

  #################GOOGLE###################
  google = Company.create(name: "Google")

  austin = Campus.create(company_id: google.id, city: "Austin", state:"Texas", zip: "78759", name: "Google Austin")
  mountview = Campus.create(company_id: google.id, city: "Mountain View", state:"California", zip: "94043", name: "Google Inc.")

  admin = User.create(admin: true, username: "admin", company_id: google.id, name: "Google Admin", email:"admin@google.com", phone_num: Faker::PhoneNumber.phone_number, password:"password")
  CampusUser.create(user_id: admin.id, campus_id: mountview.id)
  not_admin = User.create(admin: false, username: "not_admin", name: "Google NonAdmin", company_id: google.id, email:"not_admin@google.com", phone_num: Faker::PhoneNumber.phone_number, password:"password")
  CampusUser.create(user_id: not_admin.id, campus_id: austin.id)

  7.times do
    user = User.new(admin: false, company_id: google.id, username: Faker::Internet.user_name, name: Faker::Name.name, email:Faker::Internet.email, phone_num: Faker::PhoneNumber.phone_number, password:"password")
    CampusUser.create(user_id: user.id, campus_id: (rand(1..google.campuses.count)))
  end

  google.campuses.each do |campus|
    2.times do
      room = Room.create(name: "The " + Faker::Commerce.color + " room.",location:Faker::Address.city, capacity: rand(5..30), campus_id: campus.id)
      event = Event.create(user_id: google.users.sample.id, start_time: start, duration: rand(1..12), room_id: room.id, name: Faker::Company.buzzword,
                              description: Faker::Company.bs, agenda: Faker::Company.catch_phrase, private: truth.sample, allow_remote: truth.sample)
      Invite.create(event: event, user: google.users.sample)
    end
  end

  #################VALVE###################

  valve = Company.create(name: "Valve")

  kirchberg = Campus.create(company_id: valve.id, city: "Luxembourg City", state:"Luxembourg", zip: "2222", name: "Valve S.a.r.l.")
  bellevue = Campus.create(company_id: valve.id, city: "Bellevue", state:"Washington", zip: "98004", name: "Valve Headquarters")

  admin = User.create(admin: true, username: "admin", company_id: valve.id, name: "Valve Admin", email:"admin@valve.com", phone_num: Faker::PhoneNumber.phone_number, password:"password")
  CampusUser.create(user_id: admin.id, campus_id: bellevue.id)
  not_admin = User.create(admin: false, username: "not_admin", name: "Valve NonAdmin", company_id: valve.id, email:"not_admin@valve.com", phone_num: Faker::PhoneNumber.phone_number, password:"password")
  CampusUser.create(user_id: not_admin.id, campus_id: kirchberg.id)

  7.times do
    user = User.new(admin: false, company_id: valve.id, username: Faker::Internet.user_name, name: Faker::Name.name, email:Faker::Internet.email, phone_num: Faker::PhoneNumber.phone_number, password:"password")
    CampusUser.create(user_id: user.id, campus_id: (rand(1..valve.campuses.count)))
  end

  valve.campuses.each do |campu|
    2.times do
      room = Room.create(name: "The " + Faker::Commerce.color + " room.",location:Faker::Address.city, capacity: rand(5..30), campus_id: campu.id)
      event = Event.create(user_id: valve.users.sample.id, start_time: start, duration: rand(1..12), room_id: room.id, name: Faker::Company.buzzword,
                              description: Faker::Company.bs, agenda: Faker::Company.catch_phrase, private: truth.sample, allow_remote: truth.sample)
      Invite.create(event: event, user: valve.users.sample)
    end
  end

  ####################ROOM AMMENITIES PASS############################

  Room.all.each do |room|
    amens = Amenity.all.sample(rand(0..2))

    amens.each do |amen|
      RoomAmenity.create(room_id: room.id, amenity_id: amen.id)
    end
  end
end
