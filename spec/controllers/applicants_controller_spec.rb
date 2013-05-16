require 'spec_helper'

describe ApplicantsController do
  describe 'POST create' do
    let(:event) { create :event }

    def make_request
      post :create, event_id: event.to_param, applicant: attributes_for(:applicant)
    end

    describe "response" do
      before { make_request }
      it     { should respond_with(:redirect) }
      it     { should redirect_to(event) }
      xit    { should set_the_flash }
    end

    it 'creates a new applicant' do
      expect { make_request }.to change { event.applicants.count }.by(1)
    end

    it 'sends an invitation request confirmation' do
      expect { make_request }.to change { ActionMailer::Base.deliveries.size }.by(1)
    end
  end
end
