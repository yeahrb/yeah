describe Game do
  let(:instance) { described_class.new }

  describe '#resolution' do
    subject { instance.resolution }

    it { should eq V[1280, 720] }
  end

  describe '#resolution=' do
    subject { instance.method(:resolution=) }

    it_behaves_like :writer, V[256, 240]
  end
end
