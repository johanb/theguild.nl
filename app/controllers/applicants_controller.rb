class ApplicantsController < ApplicationController
  before_filter :find_event

  def create
    @event.applicants.create! applicant_params
    InvitationMessages.request_invitation(applicant_params[:email]).deliver
    redirect_to @event, notice: 'Your request has been sent. Thank you for your interest!'
  end

  private

  def applicant_params
    params.require(:applicant).permit(:email)
  end

  def find_event
    @event = Event.find(params[:event_id])
  end
end
