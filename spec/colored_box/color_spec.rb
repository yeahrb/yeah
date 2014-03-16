describe ColoredBox do
  let(:instance) { described_class.new }

  describe '#color' do
    subject { instance.color }

    it { should eq Color[0, 0, 0] }
  end

  describe '#color=' do
    subject { instance.method(:color=) }

    it_behaves_like :writer, random_vector
  end
end
