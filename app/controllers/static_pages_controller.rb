class StaticPagesController < ApplicationController
  def homepage
    @posts          = Post.all
    @latest_post    = @posts.shift
    @upcoming_event = Event.next_upcoming
    @recent_events  = Event.recent
  end

  def subscribed
  end
end
