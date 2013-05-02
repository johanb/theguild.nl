require 'spec_helper'

describe PostsController do
  describe 'GET index' do
    before do
      Post.stub(:all).and_return(%w[foo bar])
      get :index
    end

    it { should render_template('index') }
    it { should respond_with(:success) }

    it 'assigns latest post' do
      expect(assigns(:latest_post)).to_not be_nil
    end

    it 'assigns posts' do
      expect(assigns(:posts)).to_not be_nil
    end
  end

  describe 'GET show' do
    let(:post)  { create :post }
    before      { get :show, id: post.id }
    it          { should render_template('show') }
    it          { should respond_with(:success) }

    it 'assigns post' do
      expect(assigns(:post)).to eql(post)
    end
  end

  describe 'GET show as Atom' do
    before { get :index, format: 'atom' }
    it     { should render_template('index') }
    it     { should respond_with(:success) }

    it 'assigns posts' do
      expect(assigns(:posts)).to_not be_nil
    end
  end
end
