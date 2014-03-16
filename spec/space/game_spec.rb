describe Space do
  let(:instance) { described_class.new }

  describe '#game' do
    subject { instance.game }
    it { should eq nil }
  end

  describe '#game=' do
    subject { instance.method(:game=) }
    it_behaves_like :writer, Game.new

    it "sets #game's space as self" do
      instance.game = Game.new
      instance.game.space.should eq instance
    end

    it "does not set game's space as self twice" do
      instance.game = Game.new
      instance.game.should_not receive(:space=)

      instance.game = instance.game
    end
  end
end
