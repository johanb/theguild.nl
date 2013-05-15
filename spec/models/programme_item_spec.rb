require 'spec_helper'

describe ProgrammeItem do
  it { should belong_to(:event) }
  it { should belong_to(:author) }
  it { should validate_presence_of(:title) }
end
