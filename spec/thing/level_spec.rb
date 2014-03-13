describe Thing do
  describe '#level' do
    subject { described_class.new.level }

    it { should be_instance_of Level }
  end

  describe '#level=' do
    let(:instance) { described_class.new }
    subject { instance.method(:level=) }

    it_behaves_like 'writer', Level.new

    it "pushes self to value's #things" do
      instance.level = Level.new
      instance.level.things.last.should eq instance
    end

    it "doesn't push self to value's #things if already there" do
      level = Level.new
      level.things << instance
      instance.level = level
      level.things.count.should eq 1
    end
  end
end
