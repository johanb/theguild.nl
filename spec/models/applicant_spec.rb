require 'spec_helper'

describe Applicant do
  it { should belong_to(:event) }
end
