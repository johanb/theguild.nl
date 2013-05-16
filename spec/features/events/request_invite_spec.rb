require 'spec_helper'

describe 'Requesting an invite for an envite' do
  before(:all) { @event = create :event }
  after(:all)  { @event.destroy }
  let(:event)  { @event }

  context 'when not logged in' do
    def requesting_an_invitation
      within '#new_applicant' do
        fill_in 'Email', with: 'foo@bar.com'
        click_button 'Request Invitation'
      end
    end

    it 'allows me to enter my email to request an invitation' do
      visit "/events/#{event.to_param}"
      expect { requesting_an_invitation }.to change { event.applicants.count }.by(1)
      expect(page).to have_content('Your request has been sent. Thank you for your interest!')
    end

    it 'sends me an email confirmation of my request' do
      visit "/events/#{event.to_param}"
      expect { requesting_an_invitation }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end

    it 'offers me to log in instead' do
      visit "/events/#{event.to_param}"
      within '#new_applicant' do
        expect(page).to have_content('Already a member? Sign in instead')
      end
    end
  end

  context 'when logged in' do
    before { create_and_sign_in_as :user }

    it 'does not allow me to request an invite' do
      visit "/events/#{event.to_param}"
      expect(page).to_not have_css('#new_applicant')
    end
  end
end
