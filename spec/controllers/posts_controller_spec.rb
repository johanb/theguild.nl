require 'spec_helper'

describe PostsController do
  describe 'GET index' do
    before { get :index }
    it { should render_template('index') }
    it { should respond_with(:success) }

    it 'assigns posts' do
      expect(assigns(:posts)).to_not be_nil
    end
  end
end
