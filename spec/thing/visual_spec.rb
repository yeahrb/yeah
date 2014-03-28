describe Thing do
  describe '#visual' do
    subject { described_class.new.visual }

    it { should be_instance_of Invisible }

    it "defaults to <class name>Visual if it exists" do
      class Stuff < described_class; end
      class StuffVisual; end

      Stuff.new.visual.should be_instance_of StuffVisual
    end
  end

  describe '#visual=' do
    subject { described_class.new.method(:visual=) }

    it_behaves_like :writer, Object.new # todo: use null visual
  end
end
