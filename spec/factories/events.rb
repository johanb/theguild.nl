FactoryGirl.define do
  factory :event do
    sequence :name do |n|
      "event #{n}"
    end

    scheduled_at Time.now
  end
end
