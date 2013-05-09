require 'spec_helper'

describe 'Static pages routing' do
  it { expect(get: '/').to route_to('static_pages#homepage') }
  it { expect(get: '/subscribed').to route_to('static_pages#subscribed') }
end
