require 'spec_helper'

describe 'Reading event details on the event page' do
  it "shows the event description" do
    event = create :event, description: 'Lorem ipsum'
    visit "/events/#{event.to_param}"
    expect(page).to have_content('Lorem ipsum')
  end

  describe "event programme" do
    let!(:event) { create :event }

    context "when there is no programme yet" do
      it "shows a placeholder message" do
        visit "/events/#{event.to_param}"
        expect(page).to have_content('There are no confirmed sessions yet.')
      end
    end

    context "when there are programme items" do
      let!(:programme_items) { create_list :programme_item, 2, event: event }

      it "shows the programme item titles" do
        visit "/events/#{event.to_param}"
        within '.event_programme' do
          expect(page).to have_content('Item 1')
          expect(page).to have_content('Item 2')
        end
      end
    end
  end
end
