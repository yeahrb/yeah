describe Game do
  let(:instance) { described_class.new }

  describe '#level' do
    subject { instance.level }

    it { should be_instance_of Level }
  end

  describe '#level=' do
    subject { instance.method(:level=) }

    it_behaves_like :writer, Level.new

    it "sets level's game as self" do
      instance.level = Level.new
      instance.level.game.should eq instance

      instance.level = instance.level
    end

    it "does not set level's game as self twice" do
      instance.level = Level.new
      instance.level.should_not receive(:game=)

      instance.level = instance.level
    end
  end
end
