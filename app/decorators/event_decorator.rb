class EventDecorator < ApplicationDecorator
  delegate_all

  def link
    h.link_to model.name, model
  end

  def scheduled_at
    h.time_tag model.scheduled_at.to_date
  end
end
