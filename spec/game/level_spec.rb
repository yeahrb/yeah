describe Game do
  let(:instance) { described_class.new }

  describe '#space' do
    subject { instance.space }

    it { should be_instance_of Space }
  end

  describe '#space=' do
    subject { instance.method(:space=) }

    it_behaves_like :writer, Space.new

    it "sets space's game as self" do
      instance.space = Space.new
      instance.space.game.should eq instance

      instance.space = instance.space
    end

    it "does not set space's game as self twice" do
      instance.space = Space.new
      instance.space.should_not receive(:game=)

      instance.space = instance.space
    end

    it "accepts space data key" do
      background = [0.5, 0.25, 0.125]
      instance.data = {
        spaces: {
          some_space: {
            background: background
          }
        }
      }
      instance.space = :some_space

      instance.space.background.should eq background
    end
  end
end
