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

    let(:email) { 'hallo@foobar.nl' }

    context 'without admin user logged in' do
      before do
        post :create, invitation: { email: email }
      end
      let(:current_user) { nil }
      it { response.status.should eql 401 }
    end

    context 'with admin user logged in' do
      it 'adds an invitation to the database' do
        expect do
          post :create, invitation: { email: email }
        end.to change { Invitation.count }.by 1
      end

      it 'redirects back to the index' do
        post :create, invitation: { email: email }
        response.should redirect_to admin_invitations_path
      end

      it 'sets a notification message to inform sending email invite' do
        post :create, invitation: { email: email }
        flash[:notice].should eql "Invitation sent to #{email}"
      end

      context 'when entering a wrong address' do

        before do
          post :create, invitation: { email: 'crap' }
        end

        it 'renders the index page' do
          should render_template(:index)
        end

        it 'assigns the :new_invite with the faulty record' do
          assigns(:new_invite).should be_a Invitation
          assigns(:new_invite).email.should eql 'crap'
          assigns(:new_invite).should be_invalid
        end

      end
    end

  end

end
