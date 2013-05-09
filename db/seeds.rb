Post.delete_all
15.times { |n| FactoryGirl.create :post, created_at: n.days.ago }

Event.delete_all
10.times { |n| FactoryGirl.create :event, scheduled_at: n.days.ago }
5.times { |n| FactoryGirl.create :event, scheduled_at: n.days.from_now }

User.delete_all
FactoryGirl.create_list :user, 30
FactoryGirl.create_list :user, 5, :admin
FactoryGirl.create :user, :admin, email: 'test@test.com', password: 'foobarbaz', password_confirmation: 'foobarbaz'
