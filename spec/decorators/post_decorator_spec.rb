require 'spec_helper'

describe PostDecorator do
  it_should_behave_like 'application decorator'

  let(:model)    { build_stubbed :post, title: 'Foo bar', summary: 'Example post summary', created_at: DateTime.new(2013, 3, 1, 12) }
  subject(:post) { described_class.new(model) }

  it 'builds links using the post title' do
    expect(post.link).to include('Foo bar')
  end

  it 'uses a time tag for the creation date' do
    expect(post.created_at).to eql(%Q{<time class="post_date" datetime="2013-03-01T12:00:00Z" pubdate="pubdate">March 01, 2013 12:00</time>})
  end

  it 'applies Markdown to summary' do
    expect(post.summary).to eql("<p>Example post summary</p>\n")
  end

  it 'applies Markdown to body' do
    expect(post.body).to eql("<p>MyText</p>\n")
  end
end
