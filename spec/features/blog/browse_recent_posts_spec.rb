require 'spec_helper'

describe "Browse recent blog posts" do
  context "when there are no posts" do
    it "shows a place holder message" do
      visit '/'
      expect(page).to have_content("There are no blog posts yet")
    end
  end

  context 'when there is a post' do
    let!(:post) { create :post, title: 'Example post' }

    def have_post(post_title)
      have_css('.post .post_title', text: post_title)
    end

    it 'no longer shows the placeholder message' do
      visit '/'
      expect(page).to_not have_content('There are no blog posts yet')
    end

    it 'shows the post title on the page' do
      visit '/'
      expect(page).to have_post('Example post')
    end
  end

  context 'when there are multiple posts' do
    let!(:posts) { create_list :post, 2 }

    def have_posts(number_of_posts)
      have_css('.post', count: number_of_posts)
    end

    it 'shows all posts' do
      visit '/'
      expect(page).to have_posts(2)
    end
  end
end
