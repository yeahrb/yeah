describe Game do
  let(:subclass) { Class.new(described_class) }

  describe '::resolution' do
    subject { subclass.resolution }

    it { should eq nil }
  end

  describe '::resolution=' do
    subject { subclass.method(:resolution=) }

    it_behaves_like :writer, V[200, 300]
  end
end
