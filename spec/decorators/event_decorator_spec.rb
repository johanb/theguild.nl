require 'spec_helper'

describe EventDecorator do
  it_should_behave_like 'application decorator'

  let(:model)     { build_stubbed :event, name: 'Foo bar', scheduled_at: DateTime.new(2013, 3, 1, 12) }
  subject(:event) { described_class.new(model) }

  it 'builds links using the event name' do
    expect(event.link).to include('Foo bar')
  end

  it 'uses a time tag for the scheduled time' do
    expect(event.scheduled_at).to eql(%Q{<time datetime="2013-03-01">March 01, 2013</time>})

  end
end
