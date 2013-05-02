require 'spec_helper'

describe 'Listing events' do

  context 'no events' do

    it 'displays a message when no events are available' do
      visit '/'
      within 'section.events' do
        expect(page).to have_content('No events')
      end
    end
  end

  context 'Latest event'
  context 'Speficic event'
end
