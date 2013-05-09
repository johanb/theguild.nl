require 'spec_helper'

describe StaticPagesController do
  describe 'GET homepage' do
    let(:event)         { double }
    let(:recent_events) { [] }
    let(:posts)         { %w[foo bar] }

    before do
      Event.stub(:next_upcoming).and_return(event)
      Event.stub(:recent).and_return(recent_events)
      Post.stub(:all).and_return(posts)
    end

    before { get :homepage }
    it     { should render_template('homepage') }
    it     { should respond_with(:success) }
    it     { should assign_to(:latest_post).with('foo') }
    it     { should assign_to(:posts).with(posts) }
    it     { should assign_to(:recent_events).with(recent_events) }
    it     { should assign_to(:upcoming_event).with(event) }
  end

  describe 'GET subscribed' do
    before { get :subscribed }
    it     { should render_template('subscribed') }
    it     { should respond_with(:success) }
  end
end
