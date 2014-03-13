describe Color do
  let(:instance) { described_class.new }

  describe '#red' do
    subject { instance.red }

    it { should eq 0 }
  end

  describe '#red=' do
    subject { instance.method(:red=) }

    it_behaves_like :writer, 0.5
  end
end
