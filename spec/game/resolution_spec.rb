describe Game do
  let(:instance) { described_class.new }

  describe '#resolution' do
    subject { instance.resolution }

    it { should eq V[320, 180] }
  end

  describe '#resolution=' do
    subject { instance.method(:resolution=) }

    it_behaves_like 'writer', V[512, 384]
  end
end
