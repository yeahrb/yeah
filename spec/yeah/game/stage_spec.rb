describe Game do
  let(:instance) { described_class.new }

  describe '#stage' do
    subject { instance.stage }

    it { should be_instance_of NullStage }
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
end
