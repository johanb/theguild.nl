# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    sequence :title do |n|
      "Example post title #{n}"
    end

    sequence :summary do |n|
      "Example post summary #{n}"
    end

    body "MyText"
  end
end
