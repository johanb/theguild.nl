require 'spec_helper'

describe 'Reading posts in feeds' do
  it 'renders stuff as atom' do
    create :post, title: 'Foo bar'
    visit '/blog.atom'
    expect(page.response_headers['Content-Type']).to include('application/atom+xml')
    expect(page).to have_xpath('//feed/entry/title', text: 'Foo bar')
  end
end
