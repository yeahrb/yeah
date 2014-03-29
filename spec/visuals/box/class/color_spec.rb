describe Box do
  let(:subclass) { Class.new(described_class) }

  describe '::color' do
    subject { subclass.color }

    it { should eq nil }
  end

  describe '::color=' do
    subject { subclass.method(:color=) }

    it_behaves_like :writer, Color[0.1, 0.2, 0.3]
  end
end
