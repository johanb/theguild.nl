class ProgrammeItem < ActiveRecord::Base
  belongs_to :event
  validates :title, presence: true
end
