FactoryGirl.define do
  factory :event do
    sequence :name do |n|
      "event #{n}"
    end

    season 1
    sequence :episode

    scheduled_at Time.now
  end
end
