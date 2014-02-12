describe Color do
  let(:instance) { described_class.new }

  describe '#blue' do
    subject { instance.blue }

    it { should eq 0 }
  end

  describe '#blue=' do
    subject { instance.method(:blue=) }

    it_behaves_like 'writer', 0.5
  end
end
