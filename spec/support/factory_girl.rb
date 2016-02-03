require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'

    factory :admin do
      user_type "admin"
    end

    factory :user_with_subscriptions do
      after(:create) do |user|
        FactoryGirl.create(:subscription, user: user)
        FactoryGirl.create(:subscription, user: user)
        FactoryGirl.create(:subscription, user: user)
      end
    end
  end

  factory :subscription do
    twitter_handle "ez_codes"
    sequence(:phrase) { |n| "I like #{n} Turtles" }
    user
  end
end
