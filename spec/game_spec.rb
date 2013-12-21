require 'spec_helper'

describe Game do
  let(:klass) { described_class }
  let(:instance) { klass.new }

  it { klass.should be_instance_of Class }

  # For testing purposes, we don't want our thread to enter a game loop.
  before(:all) { DesktopWindow.class_eval "def each_tick; yield; end" }

  describe '#context' do
    subject { instance.context }
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

  describe '#update' do
    before { instance.stage = Stage.new }

    it "calls #stage's update" do
      instance.stage.should receive(:update)
      instance.send(:update)
    end
  end

  describe '#render' do
    before do
      instance.stage = Stage.new
      surface = Surface.new(V[10, 10])
    end

    context "after start" do
      before { instance.start }

      it "renders stage's render" do
        instance.stage.stub(:render).and_return("the stage")
        instance.context.should receive(:render).with("the stage")
        instance.send(:render)
      end
    end
  end

  describe '#stage' do
    subject { instance.stage }

    it { should be_nil }
  end

  describe '#stage=' do
    subject { instance.method(:stage=) }

    it_behaves_like 'writer', Stage.new

    it "sets stage's game as self" do
      instance.stage = Stage.new
      instance.stage.game.should eq instance

      instance.stage = instance.stage
    end

    it "does not set stage's game as self twice" do
      instance.stage = Stage.new
      instance.stage.should_not receive(:game=)

      instance.stage = instance.stage
    end
  end

  describe '#start' do
    it "instantiates a DesktopBackend for #context" do
      instance.start
      instance.context.should be_instance_of DesktopWindow
    end

    it "calls #context#each_tick with a block with #update and #render calls" do
      instance.should receive(:update)
      instance.should receive(:render)
      instance.start
    end
  end

  describe '#stop' do
    it "makes #screen nil" do
      instance.start
      instance.stop
      instance.context.should be_nil
    end

    it "breaks out of #update/#render loop initialized by #start" do
      instance.instance_eval "def update; stop; end"
      instance.should receive(:render).once
      instance.start
    end
  end
end
