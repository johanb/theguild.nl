FactoryGirl.define do
  factory :programme_item do
    sequence(:title) { |n| "Item #{n}" }
    event
    sequence(:position)
  end
end
