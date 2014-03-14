describe Game do
  let(:instance) { described_class.new }

  describe '#resolution' do
    subject { instance.resolution }

    it { should eq V[1280, 720] }
  end

  describe '#resolution=' do
    subject { instance.method(:resolution=) }

    it_behaves_like :writer, V[256, 240]
    it_behaves_like :coerces_to_vector, [100, 100]
  end
end
