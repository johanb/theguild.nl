require 'spec_helper'

describe 'Reading a single post' do
  let!(:post) { create :post, title: 'Example post', body: 'Bla' }

  it 'links each post title to a single post page' do
    visit '/'
    click_link 'Example post'
    expect(current_path).to match(%r{/blog/\d+})
  end

  it 'shows the post content on the single post page' do
    visit '/'
    click_link 'Example post'
    within '.post' do
      expect(page).to have_css('.post_title', text: 'Example post')
      expect(page).to have_css('.post_content', text: 'Bla')
    end
  end
end
