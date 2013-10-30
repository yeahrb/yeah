require 'spec_helper'

describe Vector do
  let(:klass) { described_class }
  let(:arguments) { (1..3).map { Random.rand(100)+1 } }
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

  describe '::random' do
    subject(:method) { klass.method(:random) }

    it "returns a Vector with components between 0 and nth arg" do
      max = 10
      rand_vec = klass.random(max, max, max)
      rand_vec.components.each do |c|
        (c > max).should_not be_true
        (c < 0).should_not be_true
      end
    end
  end

  describe '#inspect' do
    subject(:method) { instance.method(:inspect) }

    it "is a human-friendly representation of itself" do
      instance.components = [Random.rand(50), Random.rand(50), Random.rand(50)]
      method.call.should eq "#{klass.name}[#{instance.components.join(', ')}]"
    end
  end

  [:components, :to_a].each do |method_name|
    describe "::#{method_name}" do
      subject(:value) { instance.method(method_name).call }

      it { should be_instance_of Array }
      it { should have(3).elements }
      it { value.each { |n| n.should be_kind_of Numeric } }
    end
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

  describe '#==' do
    it { (instance == klass[*instance.components]).should eq true }
    it { (instance == klass[*instance.components.reverse]).should eq false }
    it { (instance == nil).should eq false }
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
    it "adds Vector" do
      sum = instance + instance
      sum.components.each_with_index do |component, i|
        component.should eq instance.components[i] * 2
      end
    end

    it "adds Numeric" do
      addend = Random.rand(100)
      sum = instance + addend

      sum.components.each_with_index do |component, i|
        component.should eq instance.components[i] + addend
      end
    end
  end

  describe '#-' do
    it "subtracts Vector" do
      difference = instance - instance
      difference.components.each do |component|
        component.should eq 0
      end

      difference2 = difference - instance
      difference2.components.each_with_index do |component, i|
        component.should eq -instance.components[i]
      end
    end

    it "subtracts Numeric" do
      subtrahend = Random.rand(100)
      difference = instance - subtrahend

      difference.components.each_with_index do |component, i|
        component.should eq instance.components[i] - subtrahend
      end
    end
  end

  describe '#*' do
    it "multiplies by Vector" do
      product = instance * instance
      product.components.each_with_index do |component, i|
        component.should eq instance.components[i] ** 2
      end
    end

    it "multiplies by Numeric" do
      multiple = Random.rand(100)
      product = instance * multiple

      product.components.each_with_index do |component, i|
        component.should eq instance.components[i] * multiple
      end
    end
  end

  describe '#/' do
    it "divides by Vector" do
      quotient = instance / instance
      quotient.components.each do |component|
        component.should eq 1
      end

      quotient2 = instance / quotient
      quotient2.components.each_with_index do |component, i|
        component.should eq instance.components[i]
      end
    end

    it "divides by Numeric" do
      divisor = Random.rand(100) + 1
      quotient = instance / divisor

      quotient.components.each_with_index do |component, i|
        component.should eq instance.components[i] / divisor
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

  [:magnitude, :length, :distance, :speed].each do |method_name|
    describe "##{method_name}" do
      it { klass.new(3, 4).method(method_name).call.should eq 5 }
      it { klass.new(6, 8).method(method_name).call.should eq 10 }
    end
  end

  describe '#reset' do
    it "sets components to 0" do
      instance.reset
      instance.components.should eq [0, 0, 0]
    end
  end
end

describe V do
  let(:klass) { described_class }
  it { klass.should eq Vector }
end
