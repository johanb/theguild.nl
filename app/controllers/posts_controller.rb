class PostsController < ApplicationController
  def index
    @posts          = Post.all
    @upcoming_event = Event.next_upcoming
    @recent_events  = Event.recent

    respond_to do |format|
      format.html { @latest_post = @posts.shift }
      format.atom
    end
  end

  def show
    @post = Post.find(params[:id])
  end
end
