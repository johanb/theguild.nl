require 'spec_helper'

describe Post do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:summary) }
  it { should validate_presence_of(:body) }
  it { should ensure_length_of(:title).is_at_most(250) }
  it { should ensure_length_of(:summary).is_at_most(250) }
end
