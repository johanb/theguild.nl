class Admin::InvitationsController < ApplicationController

  before_filter :verify_admin

  def index
    @new_invite = Invitation.new

  end

  def create

  end

  private

  def verify_admin
    render status: 401 unless current_user.try(:admin?)
  end
end
