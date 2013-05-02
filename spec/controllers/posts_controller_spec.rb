require 'spec_helper'

describe PostsController do
  let(:event_stub) { double }

  before do
    Event.stub(:next_upcoming).and_return(event_stub)
    Event.stub(:recent).and_return([])
  end

  describe 'GET index' do
    def make_request
      get :index
    end

    context 'response' do
      before { make_request }
      it     { should render_template('index') }
      it     { should respond_with(:success) }
    end

    it 'assigns posts' do
      make_request
      expect(assigns(:posts)).to_not be_nil
    end

    it 'assigns upcoming event' do
      events = []
      Event.should_receive(:recent).and_return(events)
      make_request
      expect(assigns(:recent_events)).to be(events)
    end

    it 'assigns upcoming event' do
      Event.should_receive(:next_upcoming).and_return(event_stub)
      make_request
      expect(assigns(:upcoming_event)).to be(event_stub)
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
