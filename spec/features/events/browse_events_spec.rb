require 'spec_helper'

describe 'Listing events' do

  context 'no events' do

    it 'displays a message when no events are available' do
      visit '/'
      within 'section.events' do
        expect(page).to have_content('There are no events yet.')
      end
    end
  end

  context 'Upcoming events scheduled' do
    let(:first_event_name) { 'Some name of upcoming event' }
    let!(:first)           { create(:event, name: first_event_name, scheduled_at: Date.today + 1) }
    let!(:second)          { create(:event, scheduled_at: Date.today + 10) }

    it 'displays the earliest upcoming event' do
      visit '/'

      within '.events .upcoming_event' do
        expect(page).to have_content(first_event_name)
      end
    end
  end

  # Scenario: Showing passed events
  # Given there are many events in the past
  # When I go to the home page
  # Then I should see the 5 latest events
  context 'Showing passed events' do
    let!(:events)         { Array.new(6) { |i| create(:event, scheduled_at: (i + 1).days.ago) } }
    let!(:earliest_event) { events.last }

    it 'displays the 5 latest events' do
      visit '/'

      expect(page).to have_css('.events .event', count: 5)
      expect(page).to have_no_css("#event_#{earliest_event.id}")
    end
  end

  context 'specific event page' do
    it 'links to the event page' do
      create :event, name: 'Event foo bar'
      visit '/'
      click_link 'Event foo bar'
      expect(page).to have_content('Event foo bar')
    end
  end
end
