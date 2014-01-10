describe Rectangle do
  describe '#size' do
    subject { described_class.new.size }

    it { should eq V[] }
  end

  describe '#size=' do
    subject { described_class.new.method(:size=) }

    it_behaves_like 'writer', random_vector
  end
end
