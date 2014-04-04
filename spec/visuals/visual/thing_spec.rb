describe Visual do
  include_examples :has_accessor, :thing do
    let(:default_type) { Thing }
    let(:assignables) { [Thing.new] }
  end

  describe '#thing=' do
    it "sets #thing's visual as self" do
      subject.thing = Thing.new
      subject.thing.visual.should eq subject
    end
  end
end
