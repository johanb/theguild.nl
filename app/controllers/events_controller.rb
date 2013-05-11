class EventsController < ApplicationController
  decorates_assigned :event, :attendees, :programme_items

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
    @programme_items = @event.programme_items
  end
end
