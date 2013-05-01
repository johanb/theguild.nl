require 'spec_helper'

describe "Posts Routing" do
  it { expect(get: '/').to route_to('posts#index') }
  it { expect(get: '/blog/1').to route_to('posts#show', id: '1') }
  it { expect(get: '/blog').to_not be_routable }
  it { expect(post_path(1)).to eql('/blog/1') }
end
