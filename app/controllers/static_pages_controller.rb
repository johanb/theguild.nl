class StaticPagesController < ApplicationController
  decorates_assigned :posts, :latest_post, :upcoming_event, :recent_events

  def homepage
    @posts          = Post.all
    @latest_post    = @posts.shift
    @upcoming_event = Event.next_upcoming
    @recent_events  = Event.recent
  end

  def subscribed
  end
end
