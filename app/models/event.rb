class Event < ActiveRecord::Base

  scope :future, -> { where('scheduled_at >= ?', Date.today) }
  scope :past,   -> { where('scheduled_at < ?', Date.today) }
  scope :recent, -> { past.limit(5).order('scheduled_at desc') }

  validates :season, :episode,
    presence: true,
    numericality: { only_integer: true, minimum: 1 }

  def self.next_upcoming
    future.order(:scheduled_at).first
  end

  def self.find(param)
    return super unless param =~ /\As(\d+)e(\d+)\Z/i
    where(season: $1, episode: $2).first!
  end

  def to_param
    's%se%s' % [season, episode]
  end
end
