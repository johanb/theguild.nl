require 'spec_helper'

describe 'Requesting an invite for an envite' do
  context 'when not logged in' do
    it 'allows me to enter my email to request an invitation'
    it 'sends me an email confirmation of my request'
    it 'offers me to log in instead'
  end

  context 'when logged in' do
    it 'does not allow me to request an invite'
  end
end
