require 'spec_helper'

describe EventsController do

  describe "GET 'show'" do
    let(:attendees)       { double }
    let(:programme_items) { double }
    let(:event)           { double attendees: attendees, programme_items: programme_items }

    before do
      Event.stub!(:find).with('1').and_return(event)
      get :show, id: '1'
    end

    it { should render_template('show') }
    it { should respond_with(:success) }
    it { should assign_to(:event).with(event) }
    it { should assign_to(:attendees).with(attendees) }
    it { should assign_to(:programme_items).with(programme_items) }
  end

end
