require 'spec_helper'

describe StaticPagesController do
  describe 'GET subscribed' do
    before { get :subscribed }
    it     { should render_template('subscribed') }
    it     { should respond_with(:success) }
  end
end
