describe Vector do
  let(:instance) { described_class.new(random_vector) }

  describe '#x' do
    subject { instance.x }

    it { should eq instance.components[0] }
  end

  describe '#x=' do
    subject { instance.method(:x=) }

    it_behaves_like :writer, Random.rand(10)
  end
end
