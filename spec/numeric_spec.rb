require 'spec_helper'

describe Numeric do
  describe '#limit' do
    subject(:meth_name) { :limit }

    it { 10.send(meth_name, 5).should eq 5 }
    it { 10.send(meth_name, 12).should eq 10 }
    it { -10.send(meth_name, 5).should eq -5 }
  end
end
