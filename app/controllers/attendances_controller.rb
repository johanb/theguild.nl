class AttendancesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_event

  def create
    @event.attendances.create! user: current_user
    flash[:notice] = 'You are attending'
    redirect_to @event
  end

  def destroy
    @event.attendances.where(user_id: current_user.id).first!.destroy
    flash[:notice] = 'You are no longer attending'
    redirect_to @event
  end

  private

  def find_event
    @event = Event.find(params[:event_id])
  end
end
