class EventsController < ApplicationController
  decorates_assigned :event, :attendees

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end
end
