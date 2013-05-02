require 'spec_helper'

describe Event do
  describe '.next_upcoming' do
    it 'returns the next upcoming event' do
      soon  = create(:event, scheduled_at: Date.today + 1)
      later = create(:event, scheduled_at: Date.today + 10)
      past  = create(:event, scheduled_at: 5.days.ago)
      expect(described_class.next_upcoming).to eql(soon)
    end

    it "shows today's first event as upcoming event" do
      morning   = create :event, scheduled_at: DateTime.new(2013, 1, 1, 9)
      afternoon = create :event, scheduled_at: DateTime.new(2013, 1, 1, 14)
      evening   = create :event, scheduled_at: DateTime.new(2013, 1, 1, 20)
      Timecop.freeze(2013, 1, 1, 15) do
        expect(described_class.next_upcoming).to eql(morning)
      end
    end

    it 'returns nil when there are no future events' do
      create :event, scheduled_at: 2.days.ago
      expect(described_class.next_upcoming).to be_nil
    end
  end
end
