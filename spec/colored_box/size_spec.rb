describe ColoredBox do
  let(:instance) { described_class.new }

  describe '#size' do
    subject { instance.size }

    it { should eq V[] }
  end

  describe '#size=' do
    subject { instance.method(:size=) }

    it_behaves_like :writer, random_vector
  end
end
