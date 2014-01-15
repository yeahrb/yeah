describe Entity do
  let(:instance) { described_class.new }

  describe '#anchor' do
    subject { instance.anchor }

    it { should eq V[] }
  end

  describe '#anchor=' do
    subject { instance.method(:anchor=) }

    it_behaves_like 'writer', Random.rand(10)/100
  end
end
