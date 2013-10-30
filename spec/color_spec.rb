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
      it { method.call(42).rgba_bytes.should eq [42, 0, 0, 255] }
      it { method.call(9, 8, 7).rgba_bytes.should eq [9, 8, 7, 255] }
      it { method.call(10, 20, 30, 40).rgba_bytes.should eq [10, 20, 30, 40] }
      it { method.call(55, 25, 55, 25).rgba_bytes.should eq [55, 25, 55, 25] }
    end
  end

  describe '#inspect' do
    it "is a human-friendly representation of itself" do
      instance.rgba_bytes = [Random.rand(50), Random.rand(50), Random.rand(50)]
      instance.inspect.should eq "#{klass.name}[#{instance.rgba_bytes.join(', ')}]"
    end
  end

  describe '#==' do
    it "is true for itself" do
      color = klass[55, 54, 53, 52]
      (color == color).should be_true
    end

    it "is true for Color of same value" do
      value = (1..4).map { Random.rand(255) }
      (klass[*value] == klass[*value]).should be_true
    end

    it "is false for Color of different value" do
      value = (1..4).map { Random.rand(255) }
      (klass[*value] == klass[*value.reverse]).should be_false
    end

    it { (klass[] == nil).should be_false }
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
