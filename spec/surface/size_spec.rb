describe Surface do
  let(:vector) { random_vector }

  describe '#size' do
    subject { described_class.new(vector).size }

    it { should eq vector }
  end

  describe '#size=' do
    subject { described_class.new.method(:size=) }

    it_behaves_like 'writer', random_vector
  end
end
