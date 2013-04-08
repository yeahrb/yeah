require 'spec_helper'

describe Yeah do
  it "is a Module" do
    Yeah.must_be_instance_of Module
  end

  describe '::Version' do
    it "is a String" do
      Yeah::Version.must_be_instance_of String
    end
  end
end
