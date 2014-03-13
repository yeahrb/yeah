describe Game do
  let(:instance) { described_class.new }

  describe '#data' do
    subject { instance.data }

    it { should eq Hash.new }
  end

  describe '#data=' do
    subject { instance.method(:data=) }

    it_behaves_like 'writer', { stuff: "lorem ipsum" }
  end
end
