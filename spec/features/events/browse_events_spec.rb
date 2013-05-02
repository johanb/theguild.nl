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

  # Scenario: Upcoming event scheduled
  #   Given there are upcoming events
  #   When I go to the home page
  #   Then I should see the earliest upcoming event
  context 'Upcoming events scheduled' do
    let!(:first) do
      FactoryGirl.create(:event, scheduled_at: Date.today + 1)
    end
    let!(:second) do
      FactoryGirl.create(:event, scheduled_at: Date.today + 10)
    end

    it 'displays the earliest upcoming event' do
      visit '/'

      within 'section.events' do
        expect(page).to have_content(first.name)
      end
    end
  end


  context 'Latest event' do

  end
  context 'Speficic event'
end
