describe Box do
  let(:subclass) { Class.new(described_class) }

  describe '::size' do
    subject { subclass.size }

    it { should eq nil }
  end

  describe '::size=' do
    subject { subclass.method(:size=) }

    it_behaves_like :writer, V[1, 2, 3]
  end
end
