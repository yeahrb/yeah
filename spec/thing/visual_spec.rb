describe Thing do
  describe '#visual' do
    subject { described_class.new.visual }

    it { should be_instance_of Invisible }
  end

  describe '#visual=' do
    subject { described_class.new.method(:visual=) }

    it_behaves_like :writer, Object.new # todo: use null visual
  end
end
