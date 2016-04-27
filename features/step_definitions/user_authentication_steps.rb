Given(/^I have an existing account$/) do
  company = Company.create!(name: "SpaceBook")
  not_admin = User.create!(admin: false, username: "test_user",
           name: "Test User",
           email:"test_user@spacebook.com",
           company_id: company.id,
           phone_num: Faker::PhoneNumber.phone_number,
           password:"password")
  campus = Campus.create!(company_id: company.id, city:Faker::Address.city, state:Faker::Address.state, zip:Faker::Address.zip, name:Faker::Name.name)
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

When(/^I press "([^"]*)"$/) do |name|
  click_button(name)
end

When(/^I click "([^"]*)"$/) do |name|
  click_link(name)
end
