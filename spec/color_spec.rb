require 'spec_helper'

describe Yeah::Color do
  let(:klass) { Yeah::Color }
  let(:instance) { klass.new }

  it { klass.should be_kind_of Class }

  [:new, :[]].each do |method_name|
    describe "::#{method_name}" do
      subject(:method) { klass.method(method_name) }

      it { method.call.should be_instance_of klass }
      it { method.call.byte_array.should eq [0, 0, 0, 255] }
      it { method.call([10, 20, 30, 40]).byte_array.should eq [10, 20, 30, 40] }
      it { method.call([55, 25, 55, 25]).byte_array.should eq [55, 25, 55, 25] }
      it { method.call(10, 20, 30, 40).byte_array.should eq [10, 20, 30, 40] }
      it { method.call(55, 25, 55, 25).byte_array.should eq [55, 25, 55, 25] }
    end
  end

  describe '#==' do
    subject(:method) { instance.method(:==).unbind }

    it "is true for itself" do
      color = klass[55, 54, 53, 52]
      method.bind(color).call(color).should eq true
    end

    it "is true for Color of same value" do
      value = (1..4).map { Random.rand(255) }
      method.bind(klass[value]).call(klass[value]).should eq true
    end

    it "is false for Color of different value" do
      value = (1..4).map { Random.rand(255) }
      method.bind(klass[value]).call(klass[value.reverse]).should eq false
    end

    it "is false for nil" do
      method.bind(klass[]).call(nil).should eq false
    end
  end

  describe '#byte_array' do
    subject(:byte_array) { instance.byte_array }

    it { should eq [0, 0, 0, 255] }
  end

  describe '#byte_array=' do
    subject(:method) { instance.method(:byte_array=) }

    it_behaves_like 'writer', (1..4).map { Random.rand(255) }
  end
end
