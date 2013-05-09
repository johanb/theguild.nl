require 'spec_helper'

describe 'Attending events' do
  def have_attendees(n)
    have_css('.attendee', count: n)
  end

  let_all(:event) { create :event }

  it 'shows attending users on the event page' do
    create_list :attendance, 2, event: event
    visit "/events/#{event.to_param}"
    expect(page).to have_attendees(2)
  end

  it 'shows a placeholder when no users are attending yet' do
    visit "/events/#{event.to_param}"
    expect(page).to have_attendees(0)
    expect(page).to have_content('No one is attending yet')
  end

  context 'when not attending yet' do
    context 'and signed in' do
      it 'allows users to indicate they will attend' do
        create_and_sign_in_as :user
        visit "/events/#{event.to_param}"
        click_button "I'm attending"
        expect(page).to have_attendees(1)
      end
    end

    context 'and not signed in' do
      it 'does not allow automatic attendance' do
        visit "/events/#{event.to_param}"
        expect(page).to have_no_button("I'm attending")
      end
    end
  end

  context 'when already attending' do
    it 'allows users to indicate they will no longer attend' do
      user = create :user
      sign_in_as user
      event.attendees << user
      visit "/events/#{event.to_param}"
      click_button "I won't attend"
      expect(page).to have_attendees(0)
    end
  end
end
