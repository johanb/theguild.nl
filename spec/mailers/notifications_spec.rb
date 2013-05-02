require "spec_helper"

describe Notifications do
  describe "invitation" do
    let(:email) { 'piet@foobar.com' }
    let(:token) { 'abcdef123' }
    let(:invitation) do
      double('invitation',
             email: email,
             token: token
            )
    end
    let(:mail) { Notifications.invitation(invitation) }

    it "renders the headers" do
      mail.subject.should eq("Guild Invitation")
      mail.to.should eq([email])
      mail.from.should eq(["from@example.com"])
    end

    it 'provides a link to complete registration' do
      mail.body.encoded.should match user_registration_url(token)
    end
  end

end
