When(/^I visit my campus$/) do
  visit("/campuses/#{Campus.first.id}")
end

Given(/^I have an existing admin account$/) do
  company = Company.create!(name: "SpaceBook")
  admin = User.create!(admin: true, username: "test_admin",
           name: "Admin User",
           email:"test_admin@spacebook.com",
           company_id: company.id,
           phone_num: Faker::PhoneNumber.phone_number,
           password:"password")
  campus = Campus.create!(company_id: company.id, city:Faker::Address.city, state:Faker::Address.state, zip:Faker::Address.zip, name:Faker::Name.name)
  CampusUser.create!(user_id: admin.id, campus_id: campus.id)
end

When(/^I fill in "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
