FactoryGirl.define do
  factory :event do
    sequence :name do |n|
      "event #{n}"
    end

    description 'Lorem ipsum dolor sit amet'

    season 1
    sequence :episode

    scheduled_at Time.now

    ignore do
      number_of_programme_items 0
    end

    after(:build) do |event, evaluator|
      evaluator.number_of_programme_items.times do |i|
        event.programme_items << FactoryGirl.create(:programme_item)
      end
    end
  end
end
