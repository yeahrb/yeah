describe Color do
  describe '#rgba_bytes' do
    subject { described_class.new.rgba_bytes }
    it { should eq [0, 0, 0, 255] }
  end

  describe '#rgba_bytes=' do
    subject { described_class.new.method(:rgba_bytes=) }
    it_behaves_like 'writer', (1..4).map { Random.rand(255) }
  end
end
