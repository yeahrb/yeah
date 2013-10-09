require 'spec_helper'

describe Color do
  let(:klass) { described_class }
  let(:instance) { klass.new }

  it { klass.should be_kind_of Class }

  [:new, :[]].each do |method_name|
    describe "::#{method_name}" do
      subject(:method) { klass.method(method_name) }

      it { method.call.should be_instance_of klass }
      it { method.call.rgba_bytes.should eq [0, 0, 0, 255] }
      it { method.call(10, 20, 30, 40).rgba_bytes.should eq [10, 20, 30, 40] }
      it { method.call(55, 25, 55, 25).rgba_bytes.should eq [55, 25, 55, 25] }
    end
  end

  describe '#inspect' do
    subject(:method) { instance.method(:inspect) }

    it "is a human-friendly representation of itself" do
      instance.rgba_bytes = [Random.rand(50), Random.rand(50), Random.rand(50)]
      method.call.should eq "#{klass.name}[#{instance.rgba_bytes.join(', ')}]"
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

  describe '#rgba_bytes' do
    subject { instance.rgba_bytes }

    it { should eq [0, 0, 0, 255] }
  end

  describe '#rgba_bytes=' do
    subject { instance.method(:rgba_bytes=) }

    it_behaves_like 'writer', (1..4).map { Random.rand(255) }
  end
end
