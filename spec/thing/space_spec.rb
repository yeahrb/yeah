describe Thing do
  include_examples :has_accessor, :space do
    let(:default_type) { Space }
    let(:assignables) { [Space.new] }
  end

  describe '#space=' do
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
