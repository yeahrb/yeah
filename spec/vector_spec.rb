require 'spec_helper'

describe Yeah::Vector do
  it "is a Class" do
    Yeah::Vector.should be_instance_of Class
  end

  [:new, :[]].each do |method_name|
    describe "::#{method_name}" do
      subject(:method) { Yeah::Vector.method(method_name) }

      it { method.call.should be_instance_of Yeah::Vector }
      it { method.call.components.should eql [0, 0, 0] }
      it { method.call(4, 5, 6).components.should eql [4, 5, 6] }
      it { method.call(8, 9).components.should eql [8, 9, 0] }
      it { method.call(7).components.should eql [7, 0, 0] }

      it "with 4 parameters raises an ArgumentError with a message "\
         "mentioning 'too many arguments'" do
        expect { method.call(7, 8, 9, 10) }.
          to raise_error ArgumentError, /too many arguments/
      end

      it "with 8 parameters raises an ArgumentError with a message "\
         "mentioning 'too many arguments'" do
        expect { method.call(*[8]*8) }.
          to raise_error ArgumentError, /too many arguments/
      end
    end
  end

  describe '#components' do
    subject { Yeah::Vector.new.components }

    it { should be_instance_of Array }
    it { should have(3).elements }

    it "has Numeric elements" do
      subject.each do |component|
        component.should be_a Numeric
      end
    end
  end
end
