class Admin::InvitationsController < ApplicationController

  before_filter :verify_admin

  def index
    @new_invite = Invitation.new
  end

  def create
    Invitation.create invitation_params
    redirect_to admin_invitations_path
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email)
  end

  def verify_admin
    render status: 401, text: '' unless current_user.try(:admin?)
  end
end
