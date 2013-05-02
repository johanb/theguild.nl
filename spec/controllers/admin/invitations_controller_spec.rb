require 'spec_helper'

describe Admin::InvitationsController do

  let(:current_user) { double('admin', admin?: true) }

  before do
    controller.stub(current_user: current_user)
  end

  describe '#index' do

    before do
      get :index
    end

    context 'without admin user logged in' do
      let(:current_user) { nil }
      it { response.status.should eql 401 }
    end

    context 'with admin user logged in' do

      its(:response) { should be_success }
      it { assigns(:new_invite).should be_a Invitation }

    end
  end

  describe '#create' do

    context 'without admin user logged in' do
      before do
        post :create, invitation: { email: 'hallo@foobar.nl' }
      end
      let(:current_user) { nil }
      it { response.status.should eql 401 }
    end

    context 'with admin user logged in' do
      it 'adds an invitation to the database' do
        expect do
          post :create, invitation: { email: 'hallo@foobar.nl' }
        end.to change { Invitation.count }.by 1
      end

      it 'redirects back to the index' do
        post :create, invitation: { email: 'hallo@foobar.nl' }
        response.should redirect_to admin_invitations_path
      end
    end
  end

end
