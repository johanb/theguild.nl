require 'spec_helper'

describe PostsController do
  let(:event)         { double }
  let(:recent_events) { [] }
  let(:posts)         { %w[foo bar] }

  before do
    Event.stub(:next_upcoming).and_return(event)
    Event.stub(:recent).and_return(recent_events)
    Post.stub(:all).and_return(posts)
  end

  describe 'GET index' do
    def make_request
      get :index
    end

    context 'response' do
      before { make_request }
      it     { should render_template('index') }
      it     { should respond_with(:success) }
      it     { should assign_to(:latest_post).with('foo') }
      it     { should assign_to(:posts).with(posts) }
      it     { should assign_to(:recent_events).with(recent_events) }
      it     { should assign_to(:upcoming_event).with(event) }
    end
  end

  describe 'GET show' do
    let(:post) { double }
    before     { Post.stub(:find).and_return(post) }
    before     { get :show, id: '1' }
    it         { should render_template('show') }
    it         { should respond_with(:success) }
    it         { should assign_to(:post).with(post) }
  end

  describe 'GET show as Atom' do
    before { get :index, format: 'atom' }
    it     { should render_template('index') }
    it     { should respond_with(:success) }
    it     { should assign_to(:posts) }
  end
end
