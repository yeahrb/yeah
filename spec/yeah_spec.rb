require 'spec_helper'

describe Yeah do
  it "is a Module" do
    Yeah.should be_instance_of Module
  end

  describe '::VERSION' do
    subject { Yeah::VERSION }

    it { should be_instance_of String }
    it { should match /[0-9]+\.[0-9]+\.[0-9]+/ }
  end
end
