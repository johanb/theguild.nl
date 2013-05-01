class Post < ActiveRecord::Base
  validates :title, :summary, :body, presence: true
  validates :title, :summary, length: { maximum: 250 }
end
