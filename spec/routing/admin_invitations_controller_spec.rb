require 'spec_helper'

describe Admin::InvitationsController, 'routing' do

  describe '/admin/invitations' do

    it 'routes to the admin invitation controller#index' do
      { get: '/admin/invitations' }.should route_to(
        controller: 'admin/invitations',
        action: 'index'
      )
    end

    it 'accepts POST requests to #create' do
      { post: '/admin/invitations' }.should route_to(
        controller: 'admin/invitations',
        action: 'create'
      )
    end
  end
end
