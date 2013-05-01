require 'spec_helper'

describe PostsController do
  describe 'GET index' do
    before { get :index }
    it     { should render_template('index') }
    it     { should respond_with(:success) }

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
end
