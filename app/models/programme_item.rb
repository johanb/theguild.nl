class ProgrammeItem < ActiveRecord::Base
  belongs_to :event
  belongs_to :author, class_name: 'User'
  validates :title, presence: true
  serialize :resources, Hash
  delegate :name, to: :author, allow_nil: true, prefix: true
end
