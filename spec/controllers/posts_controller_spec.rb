require 'spec_helper'

describe PostsController do
  describe 'GET show' do
    let(:post) { double }
    before     { Post.stub(:find).and_return(post) }
    before     { get :show, id: '1' }
    it         { should render_template('show') }
    it         { should respond_with(:success) }
    it         { should assign_to(:post).with(post) }
  end

  describe 'GET index as Atom' do
    before { get :index, format: 'atom' }
    it     { should render_template('index') }
    it     { should respond_with(:success) }
    it     { should assign_to(:posts) }
  end
end
