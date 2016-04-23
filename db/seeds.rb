# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do
user = User.new(admin: false, username: Faker::Internet.user_name, name: Faker::Name.name, email:Faker::Internet.email, phone_num: Faker::PhoneNumber.phone_number, profile_pic: Faker::Avatar.image, password:"password")
user.save!
end

admin = User.new(admin: true, username: "admin", name: Faker::Name.name, email:"admin@spacebook.com", phone_num: Faker::PhoneNumber.phone_number, profile_pic: Faker::Avatar.image, password:"password")
admin.save!

not_admin = User.new(admin: false, username: "not_admin", name: Faker::Name.name, email:"not_admin@spacebook.com", phone_num: Faker::PhoneNumber.phone_number, profile_pic: Faker::Avatar.image, password:"password")
not_admin.save!

10.times do
  campus = Campus.new(city:Faker::Address.city, state:Faker::Address.state, zip:Faker::Address.zip, name:Faker::Name.name, picture_url: Faker::Avatar.image)
  campus.save!
  10.times do
    room = campus.rooms.new(name:Faker::Name.name,location:Faker::Address.city, capacity: rand(10..30), picture_url: Faker::Avatar.image, events_count:0)
    room.save!
    20.times do
      room.events.new(user_id: rand(1..User.count), start_time: rand(Time.now-7.days..Time.now), duration: rand(1..12))
      event.save
    end
  end
end
