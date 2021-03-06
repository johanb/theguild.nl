# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "example#{n}@example.com" }
    password 'foobarbaz'
    password_confirmation { password }

    trait :admin do
      admin true
    end
  end
end
