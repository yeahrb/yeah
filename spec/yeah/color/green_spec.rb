describe Color do
  let(:instance) { described_class.new }

  describe '#green' do
    subject { instance.green }

    it { should eq 0 }
  end

  describe '#green=' do
    subject { instance.method(:green=) }

    it_behaves_like 'writer', 0.5
  end
end
