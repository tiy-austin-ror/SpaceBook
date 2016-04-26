FactoryGirl.define do
  factory :room do
    name "factory room"
    location "3rd floor"
    capacity 2000
    campus
  end

  factory :event do
    user
    room
    name "new thing"
    start_time Time.zone.now
    duration "20"
    agenda "foo bar thing"
    private false
  end

  factory :campus_user do
    user
    campus
  end

  factory :campus do
    sequence(:name) { |n| "Facotry Campus #{n}" }
  end

  factory :user do
    name 'factory test user'
    username 'factoryuser'
    sequence(:email)  { |n| "#{n}-user@example.com" }
    password 'password'
    phone_num '5555555555'
    admin false

    after(:create) do |user|
      c = create(:campus)
      create(:campus_user, user: user, campus: c)
    end
  end
end
