require 'spec_helper'

describe "Applicants routing" do
  it { expect(post: '/events/1/applicants').to route_to('applicants#create', event_id: '1') }
end
