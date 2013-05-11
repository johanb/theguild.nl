require 'spec_helper'

describe EventsController do

  describe "GET 'show'" do
    let(:attendees) { double }
    let(:event)     { double attendees: attendees }
    before do
      Event.stub!(:find).with('1').and_return(event)
      get :show, id: '1'
    end
    it { should render_template('show') }
    it { should respond_with(:success) }
    it { should assign_to(:event).with(event) }
    it { should assign_to(:attendees).with(attendees) }
  end

end