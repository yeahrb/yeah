require 'spec_helper'

describe Rectangle do
  let(:klass) { described_class }
  let(:instance) { klass.new }

  it { klass.should be_kind_of Class }

  describe '::new' do
    it { klass.new.should be_instance_of klass }
    it { klass.new.size.should eq V[] }
    it { klass.new.color.should eq Color[255, 255, 255, 255] }

    it "assigns V first argument as #size" do
      vector = V.random(40)
      klass.new(vector).size.should eq vector
    end

    it "assigns Color second argument as #color" do
      byte_array = (1..4).map { Random.rand(255) }
      color = Color[*byte_array]
      klass.new(V[], color).color.should eq color
    end
  end

  describe '#size' do
    subject { instance.size }
    it { should eq V[] }
  end

  describe '#size=' do
    subject { instance.method(:size=) }
    it_behaves_like 'writer', V.random(40)
  end

  describe '#color' do
    subject { instance.color }
    it { should eq Color[255, 255, 255, 255] }
  end

  describe '#color=' do
    subject { instance.method(:color=) }
    it_behaves_like 'writer', Color[*[Random.rand(255)]*4]
  end

  describe '#surface' do
    it { instance.surface.should be_instance_of Surface }

    it "matches size" do
      instance.size = V.random(50, 50) + V[1, 1]
      instance.surface.size.should eq instance.size
    end

    it "matches color" do
      instance.size = V[10, 10]
      instance.color = Color[*[Random.rand(255)]*4]
      surface = instance.surface
      surface.color_at(V[]).should eq instance.color
      surface.color_at(instance.size/2).should eq instance.color
      surface.color_at(instance.size-V[1, 1]).should eq instance.color
    end
  end
end
