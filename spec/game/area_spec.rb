describe Game do
  let(:instance) { described_class.new }

  describe '#area' do
    subject { instance.area }

    it { should be_instance_of Area }
  end

  describe '#area=' do
    subject { instance.method(:area=) }

    it_behaves_like 'writer', Area.new

    it "sets area's game as self" do
      instance.area = Area.new
      instance.area.game.should eq instance

      instance.area = instance.area
    end

    it "does not set area's game as self twice" do
      instance.area = Area.new
      instance.area.should_not receive(:game=)

      instance.area = instance.area
    end
  end
end
