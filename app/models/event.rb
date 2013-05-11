class Event < ActiveRecord::Base

  has_many :attendees, source: :user, through: :attendances
  has_many :attendances, dependent: :destroy
  has_many :programme_items, -> { order('position asc') }, dependent: :destroy

  scope :future, -> { where('scheduled_at >= ?', Date.today) }
  scope :past,   -> { where('scheduled_at < ?', Date.today) }
  scope :recent, -> { past.limit(5).order('scheduled_at desc') }

  attr_accessor :season, :episode
  before_create :generate_slug

  validates :season, :episode,
    presence: true,
    numericality: { only_integer: true, minimum: 1 }

  def self.next_upcoming
    future.order(:scheduled_at).first
  end

  def self.find(param)
    return super unless param =~ /\As(\d+)e(\d+)\Z/i
    where(slug: "s#{$1}e#{$2}").first!
  end

  def to_param
    slug
  end

  private

  def generate_slug
    self.slug = 's%se%s' % [season, episode]
  end
end
