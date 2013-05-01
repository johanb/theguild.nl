require 'spec_helper'

describe 'Reading a single post' do
  let!(:post) { create :post, title: 'Example post', body: 'Blah en *narf*' }

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

      within('.post_content') do
        expect(page).to have_content('Blah en narf')
      end
    end
  end
end
