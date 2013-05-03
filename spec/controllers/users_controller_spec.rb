require 'spec_helper'

describe UsersController do

  describe "GET 'index'" do
    let(:users) { [] }
    before      { User.stub(:page).and_return(users) }

    def make_request
      get :index
    end

    context 'when logged in' do
      before(:all) { @user = create(:user) }
      after(:all)  { @user.destroy }

      before do
        sign_in @user
        make_request
      end

      it { should render_template('index') }
      it { should respond_with(:success) }

      it 'passes page number to user pagination method' do
        User.should_receive(:page).with('2').and_return(users)
        get :index, page: '2'
      end

      it 'assigns users' do
        expect(assigns(:users)).to eql(users)
      end

      it 'assigns user count' do
        expect(assigns(:user_count)).to eql(1)
      end
    end

    context 'when not logged in' do
      before { make_request }
      it { should redirect_to('/users/sign_in') }
    end
  end

end
