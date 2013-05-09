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

  describe '.recent' do
    let!(:events) { Array.new(6) { |i| create(:event, scheduled_at: (i + 1).days.ago) } }
    subject { described_class.recent }
    it { should have(5).events }
    it { should_not include(events.last) }

    it 'only contains past events' do
      event = create :event, scheduled_at: 1.days.from_now
      should_not include(event)
    end
  end

  it { should validate_presence_of(:season) }
  it { should validate_presence_of(:episode) }
  it { should validate_numericality_of(:season).only_integer }
  it { should validate_numericality_of(:episode).only_integer }

  describe '#to_param' do
    subject { create(:event, season: 1, episode: 3) }
    its(:to_param) { should eql('s1e3') }
  end

  it 'finds events by slug notation' do
    event = create :event, season: 1, episode: 2
    expect(Event.find('s1e2')).to eql(event)
  end

end
