require 'spec_helper'

describe Game do
  let(:klass) { described_class }
  let(:instance) { klass.new }

  it { klass.should be_instance_of Class }

  describe '#platform' do
    subject { instance.platform }

    it { should be_instance_of Desktop }
  end

  describe '#resolution' do
    subject { instance.resolution }

    it { should eq Vector[320, 240] }
  end

  describe '#resolution=' do
    subject { instance.method(:resolution=) }

    it_behaves_like 'writer', Vector[512, 384]
  end

  describe '#entities' do
    subject(:entities) { instance.entities }

    it { should eq [] }
  end

  describe '#entities=' do
    subject(:method) { instance.method(:entities=) }

    it_behaves_like 'writer', [Entity.new(Random.rand(10))]
  end

  describe '#update' do
    it "calls #update of each element in #entities" do
      instance.entities = (1..3).map { DummyEntity.new }
      update_count = Random.rand(5)
      update_count.times { instance.update }

      instance.entities.each { |e| e.update_count.should eq update_count }
    end
  end

  describe '#draw' do
    subject(:method) { instance.method(:draw) }

    it "clears #screen" do
      instance.screen.should receive(:fill).with(Color[0, 0, 0, 0])
      method.call
    end

    it "calls #draw of each element in #entities" do
      instance.entities = (1..3).map { DummyEntity.new }
      draw_count = Random.rand(5) + 1
      draw_count.times { method.call }

      instance.entities.each do |entity|
        entity.draw_count.should eq draw_count
      end
    end

    it "draws entities on #screen" do
      color = Color[0, 255, 0, 255]
      entity = Entity.new
      entity.visual = Rectangle.new(Vector[1, 1], color)
      entity.position = Vector[Random.rand(10), Random.rand(10)]
      instance.entities << entity
      method.call

      instance.screen.color_at(entity.position).should eq color
    end

    it "writes to #platform#screen#struct#pixels" do
      pixels = instance.platform.screen.send(:struct).pixels
      pixel_data = pixels.read_string(instance.screen.data.length)
      pixel_data.should eq instance.screen.data
    end

    it "calls #platform#screen#update" do
      instance.platform.screen.should receive(:update)
      method.call
    end
  end

  describe '#screen' do
    subject(:screen) { instance.screen }

    it { should be_instance_of Surface }
    its(:size) { should eq instance.resolution }
  end

  describe '#start' do
    subject(:method) { instance.method(:start) }

    it "calls #platform#each_tick with a block" do
      instance.platform.should receive(:each_tick).and_yield
      method.call
    end

    it "calls #platform#each_tick with a block with #update and #draw calls"
  end
end
