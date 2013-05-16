require "spec_helper"

describe InvitationMessages do
  describe "request_invitation" do
    subject(:mail) { InvitationMessages.request_invitation('foo@bar.com') }
    its(:subject)  { should eql('Your invitation request at The Guild') }
    its(:to)       { should include('foo@bar.com') }
    its(:from)     { should include('staff@theguild.nl') }

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
