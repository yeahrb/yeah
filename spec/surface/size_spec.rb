describe Surface do
  let(:vector) { V.random(48, 48) + V[2, 2] }

  describe '#size' do
    subject { described_class.new(vector).size }

    it { should eq vector }
  end

  describe '#size=' do
    subject { described_class.new.method(:size=) }

    it_behaves_like 'writer', V[20, 20]
  end
end
