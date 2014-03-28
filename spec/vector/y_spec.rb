describe Vector do
  let(:instance) { described_class.new(random_vector) }

  describe '#y' do
    subject { instance.y }

    it { should eq instance.components[1] }
  end

  describe '#y=' do
    subject { instance.method(:y=) }

    it_behaves_like :writer, Random.rand(10)
  end
end
