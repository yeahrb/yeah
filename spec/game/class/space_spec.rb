describe Game do
  let(:subclass) { Class.new(described_class) }

  describe '::space' do
    subject { subclass.space }

    it { should eq nil }
  end

  describe '::space=' do
    subject { subclass.method(:space=) }

    it_behaves_like :writer, Space
  end
end
