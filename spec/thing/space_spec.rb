describe Thing do
  describe '#space' do
    include_examples :reader, :space

    its(:space) { should be_instance_of Space }
  end

  describe '#space=' do
    include_examples :writer, :space=, Space.new

    it "pushes self to value's #things" do
      subject.space = Space.new
      subject.space.things.last.should eq subject
    end

    it "doesn't push self to value's #things if already there" do
      space = Space.new
      space.things << subject
      subject.space = space
      space.things.count.should eq 1
    end
  end
end
