Post.delete_all
Event.delete_all
ProgrammeItem.delete_all
User.delete_all

15.times { |n| FactoryGirl.create :post, created_at: n.days.ago }
10.times { |n| FactoryGirl.create :event, number_of_programme_items: 5, scheduled_at: n.days.ago }
5.times { |n| FactoryGirl.create :event, number_of_programme_items: 5, scheduled_at: n.days.from_now }
FactoryGirl.create_list :user, 30
FactoryGirl.create_list :user, 5, :admin
FactoryGirl.create :user, :admin, email: 'test@test.com', password: 'foobarbaz', password_confirmation: 'foobarbaz'
