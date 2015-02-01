FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }
  sequence(:name) { |n| "user#{n}" }

  factory :boardgame do
    name "A boardgame"
    user
  end

  factory :user do
    email
    name
    password_digest 'password'
  end

  factory :group do
    name "A group"
  end

  factory :event do
    group
    date { Date.current + 1.day }
  end

  factory :rsvp do
    event
    user
  end
end
