Given(/^I have an existing account$/) do
  not_admin = User.create!(admin: false, username: "test_user",
           name: "Test User",
           email:"test_user@spacebook.com",
           phone_num: Faker::PhoneNumber.phone_number,
           profile_pic: Faker::Avatar.image,
           password:"password")
  CampusUser.new(user_id: not_admin.id, campus_id: 1)
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
