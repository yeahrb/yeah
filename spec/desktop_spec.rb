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
      resolution = Vector[Random.rand(250)+1, Random.rand(250)+1]
      method.call(resolution)
      instance.screen.size.should eq resolution.components[0..1]
    end
  end

  describe '#render' do
    subject(:method) { instance.method(:render) }

    it { expect { method.call }.to raise_error ArgumentError }

    it "renders a Surface" do
      surface = Surface.new(instance.resolution)
      surface.fill(Color[0, 255, 0, 255], Vector[0, 0], Vector[1, 1])

      screen_update_count = 0
      allow(instance.screen).to receive(:update) { screen_update_count += 1 }

      method.call(surface)
      instance.screen.get_at([0, 0]).should eq [0, 255, 0, 255]
      screen_update_count.should eq 1
    end
  end
end
