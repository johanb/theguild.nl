FactoryGirl.define do
  factory :programme_item do
    sequence(:title) { |n| "Item #{n}" }
    event
    resources({ 'Slides' => 'http://example.com', 'Video' => 'http://example.com' })
    sequence(:position)
    association :author, factory: :user
  end
end
