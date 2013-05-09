require 'spec_helper'

describe Attendance do
  it { should belong_to(:event) }
  it { should belong_to(:user) }
end
