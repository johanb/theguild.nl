require 'spec_helper'

describe 'Reading event details on the event page' do
  it "shows the event description" do
    create :event, description: 'Lorem ipsum', slug: 's1e1'
    visit "/events/s1e1"
    expect(page).to have_content('Lorem ipsum')
  end
end
