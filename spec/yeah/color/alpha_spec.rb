describe Color do
  let(:instance) { described_class.new }

  describe '#alpha' do
    subject { instance.alpha }

    it { should eq 1 }
  end

  describe '#alpha=' do
    subject { instance.method(:alpha=) }

    it_behaves_like 'writer', 0.5
  end
end
