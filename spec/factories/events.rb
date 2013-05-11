FactoryGirl.define do
  factory :event do
    sequence :name do |n|
      "event #{n}"
    end

    description 'Lorem ipsum dolor sit amet'

    season 1
    sequence :episode

    scheduled_at Time.now
  end
end
