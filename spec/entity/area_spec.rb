describe Entity do
  describe '#area' do
    subject { described_class.new.area }

    it { should be_instance_of Area }
  end

  describe '#area=' do
    let(:instance) { described_class.new }
    subject { instance.method(:area=) }

    it_behaves_like 'writer', Area.new

    it "pushes self to value's #entities" do
      instance.area = Area.new
      instance.area.entities.last.should eq instance
    end

    it "doesn't push self to value's #entities if already there" do
      area = Area.new
      area.entities << instance
      instance.area = area
      area.entities.count.should eq 1
    end
  end
end
