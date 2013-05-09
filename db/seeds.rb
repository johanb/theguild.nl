Post.delete_all
15.times { |n| FactoryGirl.create :post, created_at: n.days.ago }

Event.delete_all
10.times { |n| FactoryGirl.create :event, scheduled_at: n.days.ago }
5.times { |n| FactoryGirl.create :event, scheduled_at: n.days.from_now }
