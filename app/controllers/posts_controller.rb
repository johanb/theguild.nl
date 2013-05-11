class PostsController < ApplicationController
  decorates_assigned :post

  def index
    @posts = Post.all

    respond_to do |format|
      format.atom
    end
  end

  def show
    @post = Post.find(params[:id])
  end
end
