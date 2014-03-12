describe Level do
  describe '#background' do
    subject { described_class.new.background }

    it { should eq Color[] }
  end

  describe '#background=' do
    subject { described_class.new.method(:background=) }

    it_behaves_like 'writer', Color[*[Random.rand(255)]*4]
  end
end
