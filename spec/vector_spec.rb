require 'spec_helper'

describe Yeah::Vector do
  let(:klass) { Yeah::Vector }
  let(:instance) { klass.new(4, 5, 6) }

  it { klass.should be_instance_of Class }

  [:new, :[]].each do |method_name|
    describe "::#{method_name}" do
      subject(:method) { klass.method(method_name) }

      it { method.call.should be_instance_of klass }
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
    subject(:components) { instance.components }

    it { should be_instance_of Array }
    it { should have(3).elements }
    it { components.each { |c| c.should be_kind_of Numeric } }
  end

  describe '#[]' do
    it { instance[0].should eq 4 }
    it { instance[1].should eq 5 }
    it { instance[2].should eq 6 }
  end

  [
    [:x, :width],
    [:y, :height],
    [:z, :depth]
  ].each_with_index do |method_name_set, i|
    method_name_set.each do |method_name|
      describe "##{method_name}" do
        subject(:method) { instance.method(method_name) }

        it { method.call.should eq instance[i] }
      end
    end
  end

  [:norm, :magnitude, :length, :distance, :speed].each do |method_name|
    describe "##{method_name}" do
      it { klass.new(3, 4).method(method_name).call.should eq 5 }
      it { klass.new(6, 8).method(method_name).call.should eq 10 }
    end
  end
end
