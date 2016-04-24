Given(/^I have an existing account$/) do
  not_admin = User.create!(admin: false, username: "test_user",
           name: "Test User",
           email:"test_user@spacebook.com",
           phone_num: Faker::PhoneNumber.phone_number,
           profile_pic: Faker::Avatar.image,
           password:"password")
  campus = Campus.create!(city:Faker::Address.city, state:Faker::Address.state, zip:Faker::Address.zip, name:Faker::Name.name, picture_url: Faker::Avatar.image)
  CampusUser.create!(user_id: not_admin.id, campus_id: campus.id)
end

When(/^I go to the sign in path$/) do
  visit('/sign_in')
end

Then(/^I should see "([^"]*)"$/) do |text|
  assert page.has_content?(text)
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, content|
  fill_in(field, with: content)
end

When(/^I click "([^"]*)"$/) do |name|
  click_button(name)
end
