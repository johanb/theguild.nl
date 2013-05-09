require 'spec_helper'

describe 'Listing events' do

  context 'no events' do

    it 'displays a message when no events are available' do
      visit '/'
      within '.events' do
        expect(page).to have_content('There are no events yet.')
      end
    end
  end

  context 'Upcoming events scheduled' do
    context 'when there is an upcoming event' do
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

    context 'when there is no upcoming event' do
      it 'does not display an upcoming event' do
        visit '/'
        expect(page).to have_no_css('.events .upcoming_event')
      end
    end
  end

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
