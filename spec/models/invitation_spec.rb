require 'spec_helper'

describe Invitation do

  describe 'validations' do

    before do
      described_class.create email: 'valid@email.address'
      subject.valid?
    end

    it 'validates email' do
      subject.errors[:email].should include "invalid email address"
    end

    it { should validate_uniqueness_of :email }
  end

  describe 'invitation email' do
    include EmailSpec::Helpers
    include EmailSpec::Matchers

    let(:email) { 'henk@foo.bar' }
    let!(:invite) { described_class.create email: email }

    after do
      reset_mailer
    end

    it 'sends an email when created' do
      mailbox_for(email).should have(1).invitation
    end

    it 'can use a generated token to identify' do
      invite.token.should be_present
    end

  end
end
