class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_admin!

  decorates_assigned :users

  def index
    @users = User.page(params[:page])
    @user_count = User.count
  end
end
