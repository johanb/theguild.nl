FactoryGirl.define do
  factory :applicant do
    sequence(:email) { |n| "example#{n}@example.org" }
    event
  end
end
