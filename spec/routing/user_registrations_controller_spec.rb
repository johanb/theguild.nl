require 'spec_helper'

describe UserRegistrationsController, 'routing' do

  it 'routes /users/register/:token to #new' do
    { get: "/users/register/abcd123" }.should route_to(
      controller: 'user_registrations',
      action: 'new',
      token: 'abcd123'
    )
  end
end
