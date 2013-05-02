class Admin::InvitationsController < ApplicationController

  before_filter :verify_admin

  def index
    @new_invite = Invitation.new
  end

  def create
    invitation = Invitation.new invitation_params
    if invitation.save
      flash[:notice] = "Invitation sent to #{invitation.email}"
      redirect_to admin_invitations_path
    else
      @new_invite = invitation
      render :index
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email)
  end

  def verify_admin
    render status: 401, text: '' unless current_user.try(:admin?)
  end
end
