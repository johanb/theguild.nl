class Event < ActiveRecord::Base

  class << self
    def next_upcoming
      where('scheduled_at >= ?', Date.today).order(:scheduled_at).first
    end
  end
end
