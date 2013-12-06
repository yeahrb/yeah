require 'spec_helper'

describe Game do
  let(:klass) { described_class }
  let(:instance) { klass.new }

  it { klass.should be_instance_of Class }

  # For testing purposes, we don't want our thread to enter a game loop.
  before(:all) { DesktopBackend.class_eval "def each_tick; yield; end" }

  describe '#backend' do
    subject { instance.backend }
    it { should be_nil }
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
    context "after start" do
      before { instance.start }

      it "clears #surface" do
        instance.surface.should receive(:fill).with(Color[0, 0, 0, 0])
        instance.send(:draw)
      end

      it "gets #surface of each element in #entities" do
        instance.entities = (1..3).map { Entity.new }
        instance.entities.each { |e| e.should receive(:surface) }
        instance.send(:draw)
      end

      it "draws entities on #surface" do
        color = Color[0, 255, 0, 255]
        entity = Entity.new
        entity.visual = Rectangle.new(V[1, 1], color)
        entity.position = V[Random.rand(10), Random.rand(10)]
        instance.entities << entity
        instance.send(:draw)
        instance.surface.color_at(entity.position).should eq color
      end

      it "writes to #backend#screen#struct#pixels" do
        instance.send(:draw)
        pixels = instance.backend.screen.send(:struct).pixels
        pixel_data = pixels.read_string(instance.surface.data.length)
        pixel_data.should eq instance.surface.data
      end

      it "calls #backend#screen#update" do
        instance.backend.screen.should receive(:update)
        instance.send(:draw)
      end
    end
  end

  describe '#surface' do
    subject { instance.surface }

    it { should be_instance_of Surface }
    its(:size) { should eq instance.resolution }
  end

  describe '#start' do
    it "instantiates a DesktopBackend for #backend" do
      instance.start
      instance.backend.should be_instance_of DesktopBackend
    end

    it "calls #backend#each_tick with a block with #update and #draw calls" do
      instance.should receive(:update)
      instance.should receive(:draw)
      instance.start
    end
  end

  describe '#stop' do
    it "makes #screen nil" do
      instance.start
      instance.stop
      instance.backend.should be_nil
    end

    it "breaks out of #update/#draw loop initialized by #start" do
      instance.instance_eval "def update; stop; end"
      instance.should receive(:draw).once
      instance.start
    end
  end
end
