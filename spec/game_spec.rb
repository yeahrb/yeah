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
    it { should eq V[320, 180] }
  end

  describe '#resolution=' do
    subject { instance.method(:resolution=) }
    it_behaves_like 'writer', V[512, 384]
  end

  describe '#entities' do
    subject { instance.entities }
    it { should eq [] }
  end

  describe '#entities=' do
    subject { instance.method(:entities=) }
    it_behaves_like 'writer', [Entity.new(Random.rand(10))]

    it "assigns each item's #game as self" do
      entities = [Entity.new, Entity.new]
      instance.entities = entities

      entities.each { |e| e.game.should eq instance }
    end
  end

  describe '#update' do
    before { instance.entities = (1..3).map { Entity.new } }

    it "calls #update of each element in #entities" do
      instance.entities.each { |e| e.should receive(:update) }
      instance.send(:update)
    end
  end

  describe '#draw' do
    it "clears #screen" do
      instance.screen.should receive(:fill).with(Color[0, 0, 0, 0])
      instance.send(:draw)
    end

    it "calls #draw of each element in #entities" do
      instance.entities = (1..3).map { Entity.new }
      instance.entities.each { |e| e.should receive(:draw) }
      instance.send(:draw)
    end

    it "draws entities on #screen" do
      color = Color[0, 255, 0, 255]
      entity = Entity.new
      entity.visual = Rectangle.new(V[1, 1], color)
      entity.position = V[Random.rand(10), Random.rand(10)]
      instance.entities << entity
      instance.send(:draw)
      instance.screen.color_at(entity.position).should eq color
    end

    it "writes to #platform#screen#struct#pixels" do
      instance.send(:draw)
      pixels = instance.platform.screen.send(:struct).pixels
      pixel_data = pixels.read_string(instance.screen.data.length)
      pixel_data.should eq instance.screen.data
    end

    it "calls #platform#screen#update" do
      instance.platform.screen.should receive(:update)
      instance.send(:draw)
    end
  end

  describe '#screen' do
    subject { instance.screen }

    it { should be_instance_of Surface }
    its(:size) { should eq instance.resolution }
  end

  describe '#start' do
    it "calls #platform#each_tick with a block with #update and #draw calls" do
      instance.platform.instance_eval "def each_tick; yield; end"
      instance.should receive(:update)
      instance.should receive(:draw)
      instance.start
    end
  end

  describe '#stop' do
    it "breaks out of #update/#draw loop initialized by #start" do
      instance.instance_eval "def update; stop; end"
      instance.should receive(:draw).once
      instance.start
    end
  end
end
