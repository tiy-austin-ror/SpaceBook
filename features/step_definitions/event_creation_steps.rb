Given(/^I already have an account and a room$/) do
  user = User.create!(admin: false, username: "test_user",
           name: "Test User",
           email:"test_user@spacebook.com",
           phone_num: Faker::PhoneNumber.phone_number,
           profile_pic: Faker::Avatar.image,
           password:"password")
  campus = Campus.create!(city:Faker::Address.city, state:Faker::Address.state, zip:Faker::Address.zip, name:Faker::Name.name, picture_url: Faker::Avatar.image)
  CampusUser.create!(user_id: user.id, campus_id: campus.id)
  room = Room.create!(name:Faker::Name.name,location:Faker::Address.city, capacity: rand(10..30), picture_url: Faker::Avatar.image, events_count:0, average_capacity_use: rand(1..100), campus_id: campus.id)
end
