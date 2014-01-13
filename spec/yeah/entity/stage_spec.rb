describe Entity do
  describe '#stage' do
    subject { described_class.new.stage }

    it { should be_instance_of NullStage }
  end

  describe '#stage=' do
    let(:instance) { described_class.new }
    subject { instance.method(:stage=) }

    it_behaves_like 'writer', Stage.new

    it "pushes self to value's #entities" do
      instance.stage = Stage.new
      instance.stage.entities.last.should eq instance
    end

    it "doesn't push self to value's #entities if already there" do
      stage = Stage.new
      stage.entities << instance
      instance.stage = stage
      stage.entities.count.should eq 1
    end
  end
end
