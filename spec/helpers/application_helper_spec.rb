require 'spec_helper'

describe ApplicationHelper do
  describe '#markdown' do
    it "markdowns correctly" do
      expect(helper.markdown("test *123*")).to match("<p>test <em>123</em></p>")
    end
  end
end