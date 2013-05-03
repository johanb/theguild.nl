class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.page(params[:page])
    @user_count = User.count
  end
end
