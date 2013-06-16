require 'spec_helper'

describe Yeah::Vector do
  it "is a Class" do
    Yeah::Vector.should be_instance_of Class
  end

  [:new, :[]].each do |method|
    describe "::#{method}" do
      it "instantiates" do
        Yeah::Vector.send(method).should be_instance_of Yeah::Vector
      end

      it "with no parameters instantiates with components of [0, 0, 0]" do
        vector = Yeah::Vector.send(method)
        vector.components.should eql [0, 0, 0]
      end

      it "with parameters 4, 5, 6 instantiates with components of [4, 5, 6]" do
        vector = Yeah::Vector.send(method, 4, 5, 6)
        vector.components.should eql [4, 5, 6]
      end

      it "with parameters 8, 9 instantiates with components of [8, 9, 0]" do
        vector = Yeah::Vector.send(method, 8, 9)
        vector.components.should eql [8, 9, 0]
      end

      it "with parameter 7 instantiates with components of [7, 0, 0]" do
        vector = Yeah::Vector.send(method, 7)
        vector.components.should eql [7, 0, 0]
      end

      it "with parameters 7, 8, 9, 10 raises an ArgumentError with a message "\
         "mentioning 'too many arguments'" do
        expect { Yeah::Vector.send(method, 7, 8, 9, 10) }.
          to raise_error ArgumentError, /too many arguments/
      end

      it "with parameter *[8]*8 raises an ArgumentError with a message "\
         "mentioning 'too many arguments'" do
        expect { Yeah::Vector.send(method, *[8]*8) }.
          to raise_error ArgumentError, /too many arguments/
      end
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
