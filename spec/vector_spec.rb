require 'spec_helper'

describe Yeah::Vector do
  let(:klass) { Yeah::Vector }
  let(:arguments) { (1..3).map { Random.rand(100) } }
  let(:instance) { klass.new(*arguments) }

  it { klass.should be_instance_of Class }

  [:new, :[]].each do |method_name|
    describe "::#{method_name}" do
      subject(:method) { klass.method(method_name) }

      it { method.call.should be_instance_of klass }
      it { method.call.components.should eq [0, 0, 0] }
      it { method.call(4, 5, 6).components.should eq [4, 5, 6] }
      it { method.call(8, 9).components.should eq [8, 9, 0] }
      it { method.call(7).components.should eq [7, 0, 0] }

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

  describe '#components=' do
    it "assigns array of up to 3 elements and uses 0 for missing elements" do
      instance.components = [4, 5, 6]
      instance.components.should eq [4, 5, 6]

      instance.components = [8, 9]
      instance.components.should eq [8, 9, 0]

      instance.components = []
      instance.components.should eq [0, 0, 0]
    end

    it "complains with 4-element array" do
      expect { instance.components = [7, 8, 9, 10] }.
        to raise_error ArgumentError, /too many elements/
    end
  end

  describe '#[]' do
    it { instance[0].should eq arguments[0] }
    it { instance[1].should eq arguments[1] }
    it { instance[2].should eq arguments[2] }
  end

  describe '#[]=' do
    it "assigns n component" do
      3.times do |i|
        instance[i] = instance[i] + 5
        instance[i].should eq arguments[i] + 5
      end
    end
  end

  describe '#+' do
    it "adds other Vectors" do
      sum = instance + instance
      sum.components.each_with_index do |component, i|
        component.should eq instance.components[i] * 2
      end
    end
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

      describe "#{method_name}=" do
        subject(:method) { instance.method("#{method_name}=") }

        it "assigns value" do
          value = Random.rand(100)
          method.call(value)
          instance[i].should eq value
        end
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
