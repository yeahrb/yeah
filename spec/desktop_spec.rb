require 'spec_helper'

describe Desktop do
  let(:klass) { described_class }
  let(:instance) { klass.new }

  it { klass.should be_instance_of Class }

  describe '::new' do
    subject(:method) { klass.method(:new) }

    it { method.call.resolution.should eq Vector[320, 240] }

    it "accepts Vector as resolution" do
      vector = Vector[Random.rand(250), Random.rand(250)]
      desktop = method.call(vector)
      desktop.resolution.should eq vector
      desktop.screen.size.should eq vector[0..1]
    end
  end

  describe '#screen' do
    subject { instance.screen }

    it { should be_instance_of Rubygame::Screen }
    its(:size) { should eq [320, 240] }
  end

  describe '#resolution' do
    subject { instance.resolution }

    it { should eq Vector[320, 240] }
  end

  describe '#resolution=' do
    subject(:method) { instance.method(:resolution=) }

    it_behaves_like 'writer', Vector[Random.rand(250), Random.rand(250)]

    it "changes screen size" do
      resolution = Vector[Random.rand(250), Random.rand(250)]
      method.call(resolution)
      instance.screen.size.should eq resolution.components[0..1]
    end
  end
end
