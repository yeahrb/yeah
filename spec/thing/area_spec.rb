describe Thing do
  describe '#area' do
    subject { described_class.new.area }

    it { should be_instance_of Area }
  end

  describe '#area=' do
    let(:instance) { described_class.new }
    subject { instance.method(:area=) }

    it_behaves_like 'writer', Area.new

    it "pushes self to value's #things" do
      instance.area = Area.new
      instance.area.things.last.should eq instance
    end

    it "doesn't push self to value's #things if already there" do
      area = Area.new
      area.things << instance
      instance.area = area
      area.things.count.should eq 1
    end
  end
end
