require 'spec_helper'

describe Admin::InvitationsController do

  describe '#index' do

    before do
      controller.stub(current_user: current_user)
      get :index
    end

    context 'without admin user logged in' do

      let(:current_user) { nil }

      it { response.should eql 401 }
    end

    context 'with admin user logged in' do

      let(:current_user) { double('admin', admin?: true) }

      it { response.should be_success }
      it { assigns(:new_invite).should be_a Invitation }

    end
  end

  describe '#create' do

    before do
      controller.stub(current_user: current_user)
      get :create, invitation: { email: 'hallo@foobar.nl' }
    end

    context 'without admin user logged in' do

      let(:current_user) { nil }

      it { response.should eql 401 }
    end
  end

end
