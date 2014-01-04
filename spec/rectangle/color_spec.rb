describe Rectangle do
  describe '#color' do
    subject { described_class.new.color }

    it { should eq Color[255, 255, 255, 255] }
  end

  describe '#color=' do
    subject { described_class.new.method(:color=) }

    it_behaves_like 'writer', Color[*[Random.rand(255)]*4]
  end
end
