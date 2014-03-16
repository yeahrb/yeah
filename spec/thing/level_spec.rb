describe Thing do
  describe '#space' do
    subject { described_class.new.space }

    it { should be_instance_of Space }
  end

  describe '#space=' do
    let(:instance) { described_class.new }
    subject { instance.method(:space=) }

    it_behaves_like :writer, Space.new

    it "pushes self to value's #things" do
      instance.space = Space.new
      instance.space.things.last.should eq instance
    end

    it "doesn't push self to value's #things if already there" do
      space = Space.new
      space.things << instance
      instance.space = space
      space.things.count.should eq 1
    end
  end
end
