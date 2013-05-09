class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end
end
