require 'spec_helper'

describe Numeric do
  describe '#limit' do
    it { 10.limit(5).should eq 5 }
    it { 10.limit(12).should eq 10 }
    it { -10.limit(5).should eq -5 }
  end
end
