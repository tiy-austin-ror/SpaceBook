When(/^I go to the root path$/) do
  visit('/')
end

Given(/^I have an invitation$/) do
  company = Company.create!(name: "SpaceBook")
  campus = Campus.create(company_id: company.id, city:Faker::Address.city, state:Faker::Address.state, zip:Faker::Address.zip, name:Faker::Name.name, picture_url: Faker::Avatar.image)
  InviteCode.create(campus_id: campus.id, hash_code: 123)
end

When(/^I go to the invitation sign up page$/) do
  visit('/users/new?hash_code=123')
end

When(/^I go to the sign up path$/) do
  visit('/users/new')
end
