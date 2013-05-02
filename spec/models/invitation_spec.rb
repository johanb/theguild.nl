require 'spec_helper'

describe Invitation do

  describe 'validations' do
    let(:invitiation) { described_class.new }
    subject { invitiation.errors }

    before do
      invitiation.valid?
    end

    it 'validates email' do
      subject[:email].should include "invalid email address"
    end
  end

  describe 'invitation email' do
    include EmailSpec::Helpers
    include EmailSpec::Matchers
    let(:email) { 'henk@foo.bar' }

    before do
      described_class.create email: email
    end

    it 'sends an email when created' do
      mailbox_for(email).should have(1).invitation
    end

  end
end
