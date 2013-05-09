require 'spec_helper'

describe AttendancesController do
  before(:all) do
    @event = create :event
    @user  = create :user
  end

  after(:all) do
    @event.destroy
    @user.destroy
  end

  let(:event) { @event }
  let(:user)  { @user }

  before do
    @event.attendees.delete_all
  end

  describe 'POST create' do
    context 'when logged in' do
      before { sign_in user }
      before { post :create, event_id: event.to_param }
      it     { should redirect_to(event) }
      xit    { should set_the_flash.to('You are attending') }
      it     { expect(event.reload).to have(1).attendees }
    end

    context 'when not logged in' do
      before { post :create, event_id: event.to_param }
      it     { should redirect_to('/users/sign_in') }
      xit    { should set_the_flash.to('You need to log in first') }
      it     { expect(event).to have(0).attendees }
    end
  end

  describe 'DELETE destroy' do
    def make_request
      delete :destroy, event_id: event.to_param
    end

    before do
      event.attendees << user
      sign_in user
    end

    context 'response' do
      before { make_request }
      it { should redirect_to(event) }
      xit { should set_the_flash }
    end

    it 'removes one attendee' do
      expect { make_request }.to change { event.attendees.count }.from(1).to(0)
    end
  end
end
