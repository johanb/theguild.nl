require 'spec_helper'

describe ApplicationHelper do

  describe '#markdown' do
    let(:post) { create :post, body: "Blah en *narf*" }

    it "markdowns correctly" do
      expect(helper.markdown("test *123*")).to match("<p>test <em>123</em></p>")
    end
  end

end