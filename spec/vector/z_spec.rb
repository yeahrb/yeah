describe Vector do
  let(:instance) { described_class.new(random_vector) }

  describe '#z' do
    subject { instance.z }

    it { should eq instance.components[2] }
  end

  describe '#z=' do
    subject { instance.method(:z=) }

    it_behaves_like :writer, Random.rand(10)
  end
end
