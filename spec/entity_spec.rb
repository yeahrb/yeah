require 'spec_helper'

describe Entity do
  let(:klass) { described_class }
  let(:instance) { klass.new }

  it { klass.should be_instance_of Class }

  describe '::new' do
    it { klass.new.should be_instance_of klass }
    it { klass.new.position.should eq V[0, 0, 0] }
    it { klass.new(V[2, 4, 8]).position.should eq V[2, 4, 8] }
  end

  describe '#position' do
    subject { instance.position }

    it { should be_instance_of Vector }
    its(:components) { should eq [0, 0, 0] }
  end

  describe '#position=' do
    subject { instance.method(:position=) }
    it_behaves_like 'writer', V.random(100)
  end

  [:x, :y, :z].each do |method_name|
    describe "##{method_name}" do
      it "is #position.#{method_name}" do
        instance.position.send("#{method_name}=", Random.rand(100))
        instance.send(method_name).should eq instance.position.send(method_name)
      end
    end

    describe "##{method_name}=" do
      it "assigns #position.#{method_name}" do
        value = Random.rand(100)
        instance.send("#{method_name}=", value)
        instance.position.send(method_name).should eq value
      end
    end
  end

  describe '#size' do
    subject { instance.size }
    it { should eql nil }
  end

  describe 'size=' do
    subject { instance.method(:size=) }
    it_behaves_like 'writer', V.random(10)
  end

  describe '#visual' do
    subject { instance.visual }
    it { should eq nil }
  end

  describe '#visual=' do
    subject { instance.method(:visual=) }
    it_behaves_like 'writer', Rectangle.new(V[50, 50])
  end

  describe '#draw' do
    subject { instance.method(:draw) }

    its(:call) { should eq nil }

    it "calls #draw method of #visual if it exists" do
      instance.visual = Rectangle.new
      instance.visual.should receive(:draw)
      instance.draw
    end
  end
end
