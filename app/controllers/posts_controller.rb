class PostsController < ApplicationController
  def index
    @posts = Post.all
    @upcoming_event = Event.next_upcoming
    @recent_events = Event.recent
  end

  def show
    @post = Post.find(params[:id])
  end
end
