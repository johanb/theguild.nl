require 'spec_helper'

describe 'Attendances routing' do
  it { expect(post: '/events/s1e1/attendance').to route_to('attendances#create', event_id: 's1e1') }
  it { expect(delete: '/events/s1e1/attendance').to route_to('attendances#destroy', event_id: 's1e1') }
end
