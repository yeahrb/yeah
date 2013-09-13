require 'spec_helper'

describe Rectangle do
  let(:klass) { described_class }
  let(:instance) { klass.new }

  it { klass.should be_kind_of Class }

  describe '::new' do
    subject(:method) { klass.method(:new) }

    it { method.call.should be_instance_of klass }
    it { method.call.size.should eq Vector[] }
    it { method.call.color.should eq Color[255, 255, 255, 255] }

    it "assigns Vector first argument as #size" do
      vector = Vector[Random.rand(40)]
      method.call(vector).size.should eq vector
    end

    it "assigns second argument Color as #color" do
      byte_array = (1..4).map { Random.rand(255) }
      color = Color[*byte_array]
      method.call(Vector[], color).color.should eq color
    end
  end

  describe '#size' do
    subject(:size) { instance.size }

    it { should eq Vector[] }
  end

  describe '#size=' do
    subject(:method) { instance.method(:size=) }

    it_behaves_like 'writer', Vector[Random.rand(40)]
  end

  describe '#color' do
    subject(:color) { instance.color }

    it { should eq Color[255, 255, 255, 255] }
  end

  describe '#color=' do
    subject(:method) { instance.method(:color=) }

    it_behaves_like 'writer', [Random.rand(255)]*4
  end

  describe '#draw' do
    subject(:method) { instance.method(:draw) }

    its(:call) { should be_instance_of Surface }

    it "matches size" do
      instance.size = Vector[Random.rand(49)+1, 50]
      method.call.size.should eq instance.size
    end

    it "matches color" do
      instance.size = Vector[10, 10]
      instance.color = Color[*[Random.rand(255)]*4]
      surface = method.call
      surface.color_at(Vector[]).should eq instance.color
      surface.color_at(instance.size/2).should eq instance.color
      surface.color_at(instance.size-Vector[1, 1]).should eq instance.color
    end
  end
end
