require 'spec_helper'

describe "Browse recent blog posts" do
  context "when there are no posts" do
    it "shows a place holder message" do
      visit '/'
      expect(page).to have_content("There are no blog posts yet")
    end
  end
end