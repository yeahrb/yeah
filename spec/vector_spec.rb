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

      it "complains with 4 arguments" do
        expect { method.call(7, 8, 9, 10) }.
          to raise_error ArgumentError, /too many arguments/
      end
    end
  end

  describe '#components' do
    subject(:components) { Yeah::Vector.new.components }

    it { should be_instance_of Array }
    it { should have(3).elements }
    it { components.each { |c| c.should be_kind_of Numeric } }
  end

  describe '#[]' do
    subject(:vector) { Yeah::Vector[4, 5, 6] }

    it { vector[0].should eq 4 }
    it { vector[1].should eq 5 }
    it { vector[2].should eq 6 }
  end

  [
    [:x, :width],
    [:y, :height],
    [:z, :depth]
  ].each_with_index do |method_set, i|
    let(:vector) { Yeah::Vector[4, 5, 6] }

    method_set.each do |method_name|
      describe "##{method_name}" do
        subject(:method) { vector.method(method_name) }

        it { method.call.should eq vector[i] }
      end
    end
  end
end
