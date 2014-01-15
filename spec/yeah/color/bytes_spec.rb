describe Color do
  describe '#bytes' do
    subject { described_class.new.bytes }
    it { should eq [0, 0, 0, 255] }
  end

  describe '#bytes=' do
    subject { described_class.new.method(:bytes=) }
    it_behaves_like 'writer', (1..4).map { Random.rand(255) }
  end
end
