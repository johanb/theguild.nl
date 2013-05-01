require 'spec_helper'

describe "Posts Routing" do
  context "root" do
    it { expect(get: '/').to route_to('posts#index') }
  end
end