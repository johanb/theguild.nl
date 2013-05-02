puts "--> Clean up"

puts "     - Posts"
Post.delete_all



puts "--> Generating posts"
15.times { |n| FactoryGirl.create :post, created_at: n.days.ago }

