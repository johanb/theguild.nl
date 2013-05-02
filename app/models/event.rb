class Event < ActiveRecord::Base
  scope :future, -> { where('scheduled_at >= ?', Date.today) }
  scope :past,   -> { where('scheduled_at < ?', Date.today) }
  scope :recent, -> { past.limit(5).order('scheduled_at desc') }

  class << self
    def next_upcoming
      future.order(:scheduled_at).first
    end
  end
end
