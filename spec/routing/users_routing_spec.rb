require 'spec_helper'

describe 'Routing to users' do
  it { expect(get: '/users').to route_to('users#index') }
  it { expect(get: '/users/page/2').to route_to('users#index', page: '2') }
end
