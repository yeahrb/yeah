require 'spec_helper'

describe Yeah::Vector do
  it "is a Class" do
    Yeah::Vector.should be_instance_of Class
  end

  describe '::[]' do
    it "instantiates" do
      Yeah::Vector[].should be_instance_of Yeah::Vector
    end
  end
end
