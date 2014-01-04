describe Stage do
  let(:instance) { described_class.new }

  describe '#game' do
    subject { instance.game }
    it { should eq nil }
  end

  describe '#game=' do
    subject { instance.method(:game=) }
    it_behaves_like 'writer', Game.new

    it "sets #game's stage as self" do
      instance.game = Game.new
      instance.game.stage.should eq instance
    end

    it "does not set game's stage as self twice" do
      instance.game = Game.new
      instance.game.should_not receive(:stage=)

      instance.game = instance.game
    end
  end
end
