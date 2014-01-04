describe DesktopWindow do
  let(:instance) { described_class.new }

  describe '#resolution' do
    subject { instance.resolution }
    it { should eq V[320, 180] }
  end

  describe '#resolution=' do
    subject { instance.method(:resolution=) }

    it_behaves_like 'writer', V.random(250, 250)

    it "changes screen size" do
      resolution = V.random(250, 250) + V[1, 1]
      instance.resolution = resolution
      instance.screen.size.should eq resolution.components[0..1]
    end
  end
end
