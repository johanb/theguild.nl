require 'spec_helper'

describe 'Event routing' do
  it { expect(get: '/events/1').to route_to('events#show', id: '1') }
end
