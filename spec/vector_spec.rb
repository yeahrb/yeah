require 'spec_helper'

describe Yeah::Vector do
  it "is a Class" do
    Yeah::Vector.should be_instance_of Class
  end

  describe '::[]' do
    it "instantiates" do
      Yeah::Vector[].should be_instance_of Yeah::Vector
    end

    it "with no parameters instantiates with components of [0, 0, 0]" do
      vector = Yeah::Vector[]
      vector.components.should eql [0, 0, 0]
    end

    it "with parameters 4, 5, 6 instantiates with components of [4, 5, 6]" do
      vector = Yeah::Vector[4, 5, 6]
      vector.components.should eql [4, 5, 6]
    end
  end

  describe '#components' do
    before do
      @vector = Yeah::Vector[]
    end

    it "is an Array" do
      @vector.components.should be_instance_of Array
    end

    it "has 3 Numeric elements" do
      @vector.components.should have(3).elements

      @vector.components.each do |c|
        c.should be_a Numeric
      end
    end
  end
end
